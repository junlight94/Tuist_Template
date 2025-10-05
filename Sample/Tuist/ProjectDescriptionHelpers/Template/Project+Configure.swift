//
//  Project+.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 8/20/25.
//

import ProjectDescription

extension Project {
    /// 앱 프로젝트 설정
    /// - Parameters:
    ///   - configuration: 앱 설정 정보 (프로젝트명, 배포 타겟, 설정 등)
    ///   - dependencies: 앱 타겟에 추가할 의존성 배열
    /// - Returns: 구성된 앱 프로젝트
    static func configureApp(
        configuration: AppConfiguration,
        dependencies: [TargetDependency]
    ) -> Self {
        // 앱 메인 타겟 생성
        let appTarget = Target.target(
            name: configuration.projectName,
            destinations: configuration.destination,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: configuration.deploymentTarget,
            infoPlist: .extendingDefault(with: InfoPlist.appInfoPlist),
            sources: ["Sources/**"],
            resources: [.glob(pattern: "Resources/**", excluding: [])],
            entitlements: configuration.entitlements,
            dependencies: dependencies,
            settings: configuration.setting
        )
        
        // 앱 스킴 생성
        let appScheme = Scheme.configureAppScheme(
            schemeName: configuration.projectName
        )
        
        // 프로젝트 생성 및 반환
        return Project(
            name: configuration.projectName,
            organizationName: configuration.organizationName,
            settings: configuration.setting,
            targets: [appTarget],
            schemes: appScheme
        )
    }
    
    /// 단순 모듈 프로젝트 설정 (Domain, Data, Core 등)
    /// - Parameters:
    ///   - configuration: 앱 설정 정보
    ///   - name: 모듈 이름
    ///   - product: 프로덕트 타입
    ///   - hasResources: 리소스 파일 포함 여부 (기본값: false)
    ///   - hasTests: 테스트 타겟 포함 여부 (기본값: false)
    ///   - hasDemo: 데모 타겟 포함 여부 (기본값: false)
    ///   - hasInterface: 인터페이스 모듈 포함 여부 (기본값: false)
    ///   - dependencies: 의존성 배열
    /// - Returns: 구성된 모듈 프로젝트
    static func configureModule(
        configuration: AppConfiguration,
        demoConfiguration: DemoConfiguration = .disabled,
        name: String,
        product: Product,
        hasResources: Bool = false,
        hasTests: Bool = false,
        hasInterface: Bool = false,
        dependencies: [TargetDependency]
    ) -> Self {
        var targets: [Target] = []
        var schemes: [Scheme] = [Scheme.configureScheme(
            schemeName: name
        )]
        
        // 인터페이스 타겟 생성 (옵션)
        if hasInterface {
            let interfaceTarget = createInterfaceTarget(
                name: name,
                configuration: configuration,
                product: product,
                dependencies: dependencies
            )
            targets.append(interfaceTarget)
        }
        
        // 메인 프레임워크 타겟 생성
        let frameworkTarget = createFrameworkTarget(
            name: name,
            configuration: configuration,
            product: product,
            dependencies: hasInterface ? [.target(name: "\(name)Interface")] : dependencies
        )
        targets.append(frameworkTarget)
        
        // 테스트 타겟 생성 (옵션)
        if hasTests {
            let testTarget = createTestTarget(
                name: name,
                configuration: configuration,
                dependencies: [
                    .target(name: name)
                ]
            )
            targets.append(testTarget)
        }
        
        // 데모 타겟 생성 (옵션)
        if demoConfiguration.isEnabled {
            let demoTarget = createDemoTarget(
                name: name,
                appConfiguration: configuration,
                demoConfiguration: demoConfiguration
            )
            targets.append(demoTarget)
            schemes.append(Scheme.configureDemoAppScheme(schemeName: "\(name)Demo"))
        }
        
        // 프로젝트 생성 및 반환
        return Project(
            name: name,
            organizationName: configuration.organizationName,
            settings: configuration.setting,
            targets: targets,
            schemes: schemes
        )
    }
    
    /// 마이크로 피처 모듈 프로젝트 설정 (Feature 모듈)
    /// Feature 모듈은 Interface, Framework, Demo, Test, Tests 타겟을 모두 포함하는 복합 모듈입니다.
    /// - Parameters:
    ///   - configuration: 앱 설정 정보
    ///   - product: 프로덕트 타입
    ///   - name: 모듈 이름
    ///   - organizationName: 조직 이름
    ///   - dependencies: 의존성 배열
    ///   - settings: 프로젝트 설정
    /// - Returns: 구성된 마이크로 피처 프로젝트
    static func configureMicroFeatureProject(
        appConfiguration: AppConfiguration,
        demoConfiguration: DemoConfiguration,
        product: Product,
        name: String,
        organizationName: String,
        dependencies: [TargetDependency],
        settings: Settings
    ) -> Project {
        
        // Interface 타겟 - 의존성 인터페이스 정의
        let interfaceTarget = createInterfaceTarget(
            name: name,
            configuration: appConfiguration,
            product: product,
            dependencies: dependencies
        )
        
        // Framework 타겟 - 메인 구현체
        let frameworkTarget = createFrameworkTarget(
            name: name,
            configuration: appConfiguration,
            product: product,
            dependencies: [
                .target(name: "\(name)Interface")
            ]
        )
        
        // Demo 타겟 - 데모 앱
        let demoTarget = createDemoTarget(
            name: name,
            appConfiguration: appConfiguration,
            demoConfiguration: demoConfiguration
        )
        
        // Test 타겟 - 테스트 더블 및 모킹
        let testTarget = createFrameworkTarget(
            name: "\(name)Test",
            configuration: appConfiguration,
            product: product,
            dependencies: [
                .target(name: "\(name)Interface")
            ]
        )
        
        // Tests 타겟 - 실제 테스트 코드
        let testsTarget = createTestTarget(
            name: name,
            configuration: appConfiguration,
            dependencies: [
                .target(name: "\(name)Test"),
                .target(name: name)
            ]
        )
        
        // 모든 타겟을 배열로 구성
        let targets = [interfaceTarget, frameworkTarget, demoTarget, testsTarget, testTarget]
        
        // 스킴 구성 (메인 스킴 + 데모 스킴)
        let schemes = [
            Scheme.configureScheme(schemeName: name),
            Scheme.configureDemoAppScheme(schemeName: "\(name)Demo")
        ]
        
        // 마이크로 피처 프로젝트 생성 및 반환
        return Project(
            name: name,
            organizationName: organizationName,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}
