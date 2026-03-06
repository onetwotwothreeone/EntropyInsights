import SwiftUI
import RevenueCat
import RevenueCatUI

struct ContentView: View {

    @State private var isProSubscriber: Bool = false
    @State private var isLoadingCustomerInfo: Bool = true
    @State private var isShowingSettings: Bool = false

    private let essayText: String =
    """
    엔트로피는 언제나 증가하지만,
    그 안에서 우리는 잠시 멈춰 서로를 바라볼 수 있다.

    완벽하게 통제할 수 없는 우주 속에서도
    오늘 내가 소중히 여기는 것들을 향해
    천천히, 그러나 정성스럽게 걸어가는 일.

    그 느린 걸음이야말로
    여유롭고도 풍요로운 존재 방식일지 모른다.
    """

    var body: some View {
        NavigationStack {
            ZStack {
                // 배경
                LinearGradient(
                    colors: [
                        Color(.systemBackground),
                        Color(.secondarySystemBackground)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 32) {
                    Spacer()

                    // 중앙: 카드 형태의 에세이 영역
                    VStack(alignment: .leading, spacing: 20) {
                        Text("오늘의 에세이")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text(essayText)
                            .font(.system(.body, design: .serif))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(6)

                        if isProSubscriber {
                            Divider()
                                .padding(.top, 8)

                            Text("감사합니다, 당신은 소중한 후원자입니다.")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(24)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 12)
                    .padding(.horizontal, 24)

                    Spacer()

                    // 하단: 후원 버튼 (필요할 때만 페이월 표시)
                    Button {
                        // `presentPaywallIfNeeded`가 entitlement 상태를 보고 필요한 경우에만 페이월을 표시합니다.
                    } label: {
                        Text("여유로운 창작자 후원하기")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                    .presentPaywallIfNeeded(
                        requiredEntitlementIdentifier: "sollos Pro",
                        presentationMode: .sheet
                    )
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                }
            }
            .navigationTitle("EntropyInsights")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .accessibilityLabel("설정")
                }
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
        // 화면 진입 시 현재 Entitlement 상태를 한 번 조회해서
        // 감사 문구 노출 여부를 결정
        .task {
            await loadCustomerInfo()
        }
    }

    // MARK: - RevenueCat 상태 로딩

    private func loadCustomerInfo() async {
        do {
            let info = try await Purchases.shared.customerInfo()
            await MainActor.run {
                self.isProSubscriber = info.entitlements["sollos Pro"]?.isActive == true
                self.isLoadingCustomerInfo = false
            }
        } catch {
            await MainActor.run {
                self.isProSubscriber = false
                self.isLoadingCustomerInfo = false
            }
        }
    }
}

#Preview {
    ContentView()
}
