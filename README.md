## Clean Architecture 기반의 모듈 구조
![image](https://github.com/user-attachments/assets/1aaa73d0-e3c2-4fb3-9e7a-d967c8439295)

<br>

## 폴더 구조
```
├── AppModule
│   └── Sample
├── CoreKit
│   ├── Core
│   └── DesignKit
├── Data
│   ├── Data.xcodeproj
│   ├── Derived
│   ├── Sources
│   └── Tests
├── Domain
│   ├── Derived
│   ├── Domain.xcodeproj
│   ├── Sources
│   └── Tests
├── Features
│   └── MainFeature
└── Modules
    ├── NetworkModule
    ├── Shared
    └── ThirdPartyLibrary
```

<br>

## 의존성 그래프
<img src="https://github.com/junlight94/Tuist_Template/blob/main/Sample/graph.png" width=350/>

- Data
    - 실제 데이터를 가져오고 저장하는 역할을 담당.
    - Remote 데이터 소스(서버 통신)와 Local 데이터 소스(DB, 캐싱)를 관리.
    - Repository 구현체를 통해 Domain 모듈에서 정의한 인터페이스를 구현하여 실제 데이터를 제공.
 
- Feature
    - 각 화면 단위를 기준으로 기능(Feature)을 담당하는 모듈.
    - UI와 상태 관리를 포함하며, Domain 모듈을 통해 비즈니스 로직을 호출
 
- Core
    - Feature 간에 재사용 가능한 비즈니스 로직, 공통 인터페이스, 유틸리티를 제공.

- DesignKit
    - 앱 전반적으로 사용하는 디자인 리소스(폰트, 색상, 이미지) 및 UI 컴포넌트(버튼, 카드 뷰 등)를 제공.

- Domain
    - 앱의 핵심 비즈니스 로직을 담당.
    - UseCase를 통해 비즈니스 로직을 정의하고, Entity를 통해 도메인 모델을 정의함.
    - Repository 인터페이스를 정의하여 Data 모듈에 구현을 위임

- Shared
    - 앱 전반적으로 공통적으로 사용될 수 있는 로직을 제공.
    - 앱 설정 관리, 공통 상수, 앱 전역적으로 사용하는 헬퍼 함수.

- ThirdPartyLibrary
    - 앱에서 공통으로 사용하는 외부 라이브러리 관리.
