# 🌌 EntropyInsights

**EntropyInsights**는 엔트로피라는 우주의 법칙 속에서 소중한 존재들과 함께 여유롭고 풍요롭게 존재하는 방법을 제안하는 iOS SwiftUI 기반 철학 에세이 앱입니다. 이 프로젝트는 필드 서비스 엔지니어(FSE)로서 복잡한 시스템을 다루던 정밀함을 소프트웨어 설계에 이식하고, **RevenueCat SDK**를 통해 정교한 구독 시스템을 구현하는 데 초점을 맞췄습니다.

## 🛠️ Key Technical Highlights

* **RevenueCat SDK Integration**: 안정적인 인앱 결제 인프라를 구축하고 `presentPaywallIfNeeded`를 통해 효율적인 페이월 시스템을 구현했습니다.
* **Real-time Entitlement Management**: `sollos Pro` 권한 상태를 앱의 UI와 실시간으로 동기화하여 유저에게 즉각적인 피드백을 제공합니다.
* **Fail-safe Subscription Control**: iOS 15+ 네이티브 구독 관리 시트(`AppStore.showManageSubscriptions`)와 웹 URL 폴백 시스템을 결합하여 유저의 구독 통제권을 보장합니다.
* **Modular Architecture**: SwiftUI와 StoreKit 2, RevenueCat을 결합하여 확장 가능하고 유지보수가 용이한 시스템을 설계했습니다.

## 🔍 DSE Case Studies: Problem Solving & Debugging

개발 과정에서 마주한 시스템적 오류들을 분석하고 해결하며 기술적 성장을 이뤄냈습니다:

### 1. Credentials Authentication Issue
* **Problem**: 앱 초기화 중 `Invalid API Key` 에러 발생으로 서버 통신 실패.
* **Analysis**: Xcode 디버그 로그 분석을 통해 잘못된 키 형식이 사용되었음을 진단.
* **Solution**: RevenueCat 대시보드의 Public SDK Key를 정확히 재설정하여 인증 시스템 정상화.

### 2. Entitlement Identifier Mismatch
* **Problem**: 결제 성공 후에도 프리미엄 기능(후원자 문구)이 활성화되지 않는 현상 발생.
* **Analysis**: 대시보드의 `sollos Pro` 식별자와 코드 내 하드코딩된 문자열의 불일치(Entropy) 발견.
* **Solution**: 데이터 정합성을 일치시켜 시스템 간 완벽한 통신 흐름 구축.

### 3. Git Remote Configuration Error
* **Problem**: `fatal: repository not found` 에러로 인한 버전 관리 중단.
* **Analysis**: 원격 주소(Remote URL)가 프로젝트 단위가 아닌 파일 단위로 잘못 설정됨을 파악.
* **Solution**: 터미널 명령어를 통해 원격 주소를 재설정하고 `--force` 푸시를 통해 기존 저장소와의 동기화 완료.

## 📐 Philosophy & Background

> "시스템의 엔트로피는 항상 증가하지만, 정교한 설계를 통해 우리는 그 속에서 질서와 여유를 찾을 수 있습니다."

저는 필드 서비스 엔지니어로서 로봇 시스템을 최적화하던 경험을 바탕으로, 이제는 유저의 삶을 풍요롭게 만드는 시스템 디자이너로 나아가고 있습니다. 이 앱은 그 여정의 첫 번째 증거입니다.

---
**Developed by Sol Kim**  
*Systems Designer | Field Service Engineer*  
[LinkedIn](본인의_링크드인_주소) | [Portfolio](본인의_포트폴리오_주소)
