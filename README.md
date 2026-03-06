Gemini said
RevenueCat DSE(Developer Support Engineer) 지원자로서 솔 님의 기술적 전문성과 시스템 설계 철학이 가장 돋보일 수 있는 영문 README 초안을 작성해 드립니다.

이 내용을 깃허브의 README.md 파일에 복사해서 붙여넣으시면, 면접관들에게 솔 님의 트러블슈팅 능력을 완벽하게 증명할 수 있습니다.

🌌 EntropyInsights
EntropyInsights는 우주의 엔트로피 법칙 속에서 여유와 풍요를 찾는 철학적 에세이를 전달하는 iOS SwiftUI 앱입니다. 단순히 텍스트를 보여주는 것을 넘어, RevenueCat SDK를 통합하여 시스템의 복잡성을 관리하고 사용자에게 투명한 구독 통제권을 제공하는 것을 목표로 설계되었습니다.

🛠️ Key Technical Highlights
RevenueCat Integration: RevenueCat SDK를 활용하여 인앱 결제 및 구독 인프라를 구축했습니다.

System State Synchronization: Purchases.shared.getCustomerInfo를 활용해 앱 내부 UI와 서버의 구독 상태(sollos Pro)를 실시간으로 동기화합니다.

Fail-safe Subscription Management: iOS 15+의 AppStore.showManageSubscriptions를 우선 사용하고, 시스템 예외 발생 시 웹 URL로 연결되는 이중화된 구독 관리 로직을 구현했습니다.

AI-Driven Development: Cursor AI를 활용하여 효율적인 코드 작성 및 시스템 아키텍처 설계를 진행했습니다.

🔍 Debugging & Troubleshooting (DSE Focus)
프로젝트 진행 중 발생한 기술적 문제를 해결하며 시스템에 대한 이해도를 높였습니다:

Credential Authentication Error: 앱 초기화 단계에서 발생한 Invalid API Key 이슈를 Xcode 콘솔 로그 분석을 통해 진단하고, Public SDK Key 정정을 통해 해결했습니다.

Entitlement ID Mismatch: 결제 성공 후에도 UI가 업데이트되지 않는 문제를 발견, RevenueCat 대시보드의 Identifier(sollos Pro)와 코드상의 식별자가 불일치함을 찾아내어 데이터 정합성을 맞췄습니다.

Git/GitHub Remote Sync: 저장소 연결 오류(fatal: repository not found)를 터미널 명령어를 통한 원격 주소 재설정과 강제 전송(--force)으로 해결하며 버전 관리 체계를 정상화했습니다.

📐 Philosophy
"엔트로피는 항상 증가하지만, 그 속에서 우리는 잠시 멈춰 서로를 바라볼 수 있다."

이 앱은 필드 서비스 엔지니어(FSE)로서 복잡한 로봇 시스템을 다루던 정밀함과, 시스템 설계자로서 추구하는 '복잡성 감소'의 가치를 담고 있습니다.

Developed by Sol Kim

Role: Systems Designer & Field Service Engineer

Goal: Transitioning from executing systems to designing seamless user experiences.
