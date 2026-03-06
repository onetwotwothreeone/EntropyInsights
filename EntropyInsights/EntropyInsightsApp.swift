import SwiftUI
import RevenueCat

@main
struct EntropyInsightsApp: App {

    init() {
        // 디버그 로그(원하면 제거 가능)
        Purchases.logLevel = .debug

        // RevenueCat 초기화
        Purchases.configure(withAPIKey: "test_uvfvZWOjZKDduIDOCasLwtauoNx")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
