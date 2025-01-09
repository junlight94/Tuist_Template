## Clean Architecture 기반의 모듈 구조
![image](https://github.com/user-attachments/assets/1aaa73d0-e3c2-4fb3-9e7a-d967c8439295)

<br>

## 폴더 구조
```
├── AppModule
│   └── TestProject
├── Core
│   └── DesignKit
├── Data
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
<img src="https://github.com/junlight94/Tuist_Template/blob/main/TestProject/graph.png" width=350/>

