## 전체 모듈 구조
<img src="https://github.com/user-attachments/assets/eab66744-bfdc-4126-8a42-5c68cf0720dc" width=700 alt="Module" />

Feature에는 MicroFeature 아키텍처를 적용하였습니다. <br>
이를 통해 각 Feature가 독립적으로 동작하면서도, 유연하게 수평 확장될 수 있도록 구성하였습니다.

✅ Demo → Feature를 단독으로 실행할 수 있는 데모 앱 모듈 <br>
✅ Test → Feature를 검증하는 테스트 코드 <br>
✅ Feature → 실제 Feature의 구현체 <br>
✅ Testing → Mock 데이터 및 테스트 지원 유틸리티 <br>
✅ Interface → Feature 간의 의존성을 줄이기 위한 Interface 정의

<br>

## Clean Architecture 기반의 모듈 구조
![image](https://github.com/user-attachments/assets/1aaa73d0-e3c2-4fb3-9e7a-d967c8439295)

<br>

## 프로젝트 폴더 구조
```
├── AppModule
│   └── Sample
├── SampleService
│   ├── CoreKit
│   │   ├── Core
│   │   └── DesignKit
│   ├── Data
│   ├── Domains
│   │   ├── Domain
│   │   └── SampleDomain
│   ├── Features
│   │   ├── MainFeature
│   │   ├── RootFeature
│   │   └── SampleFeature
│   ├── Modules
│   │   ├── NetworkModule
│   │   ├── Shared
│   │   └── ThirdPartyLibrary
│   └── Service
└── Umbrella
```

<br>

## 의존성 그래프
<img src="https://github.com/junlight94/Tuist_Template/blob/service/Sample/graph.png" />

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

<br>

## Scaffold + ShellScript를 통한 모듈 자동 생성 및 의존성 연결

Project 폴더 위치에서 `make moule` <br>
module을 만들 Service를 선택합니다. (현재는 SampleService 1개)

![스크린샷 2025-02-21 오후 2 03 02](https://github.com/user-attachments/assets/31b39af4-ffc2-4d54-b692-3da76dd9108b)

<br>

만들 모듈의 종류 선택 (Feature, Domain)

![스크린샷 2025-02-21 오후 2 03 27](https://github.com/user-attachments/assets/b749950d-88c1-4396-99e8-0cdb349b54ad)

<br>

모듈 이름 입력 후 자동 생성

![스크린샷 2025-02-21 오후 2 04 04](https://github.com/user-attachments/assets/6ccd30f9-0c48-4d99-9685-c0c69808162c)


