import SwiftUI
import StoreKit
import RevenueCat
import UIKit

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var isProSubscriber: Bool = false
    @State private var isRefreshing: Bool = false
    @State private var lastErrorMessage: String?

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 12) {
                        Image(systemName: isProSubscriber ? "checkmark.seal.fill" : "seal")
                            .foregroundStyle(isProSubscriber ? .green : .secondary)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("구독 상태")
                                .font(.headline)
                            Text(isProSubscriber ? "sollos Pro 활성" : "활성 구독 없음")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        if isRefreshing {
                            ProgressView()
                        }
                    }
                }

                Section {
                    Button {
                        Task {
                            await openManageSubscriptions()
                        }
                    } label: {
                        HStack {
                            Text("구독 관리")
                            Spacer()
                            Image(systemName: "arrow.up.right.square")
                                .foregroundStyle(.secondary)
                        }
                    }
                } footer: {
                    Text("Apple 구독 관리 화면으로 이동합니다. 문제가 있으면 웹 페이지로 연결됩니다.")
                }

                if let lastErrorMessage {
                    Section {
                        Text(lastErrorMessage)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    } header: {
                        Text("상태")
                    }
                }
            }
            .navigationTitle("설정")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("닫기") { dismiss() }
                }
            }
            .task {
                await refreshSubscriptionStatus()
            }
        }
    }

    private func openManageSubscriptions() async {
        lastErrorMessage = nil

        // iOS 15+ 우선: AppStore.showManageSubscriptions
        if #available(iOS 15.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first
            {
                do {
                    try await AppStore.showManageSubscriptions(in: windowScene)
                    // Task 완료(사용자가 구독 관리 화면에서 돌아온 뒤) 최신화
                    await refreshSubscriptionStatus()
                    return
                } catch {
                    lastErrorMessage = "구독 관리 화면을 여는 데 실패했습니다. 웹으로 전환합니다."
                }
            } else {
                lastErrorMessage = "화면 정보를 가져올 수 없습니다. 웹으로 전환합니다."
            }
        }

        // Fail-safe: 웹 구독 관리 페이지로 이동
        if let url = URL(string: "https://apps.apple.com/account/subscriptions") {
            await MainActor.run {
                UIApplication.shared.open(url)
            }
        }

        // 사용자가 웹에서 돌아왔을 수도 있으니 즉시 한 번 최신화
        await refreshSubscriptionStatus()
    }

    private func refreshSubscriptionStatus() async {
        isRefreshing = true
        defer { isRefreshing = false }

        Purchases.shared.getCustomerInfo { info, error in
            Task { @MainActor in
                if let info {
                    isProSubscriber = info.entitlements["sollos Pro"]?.isActive == true
                } else {
                    isProSubscriber = false
                }

                if let error {
                    lastErrorMessage = "구독 상태를 갱신하지 못했습니다: \(error.localizedDescription)"
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
