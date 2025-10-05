//
//  Project+Target.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 10/5/25.
//

import ProjectDescription

extension Project {
    /// 데모 앱 타겟 생성
    /// 모듈의 기능을 시연할 수 있는 독립적인 앱 타겟을 생성합니다.
    /// - Parameters:
    ///   - name: 모듈 이름
    ///   - appConfiguration: 앱 설정 정보
    ///   - demoConfiguration: 데모앱 설정 정보
    /// - Returns: 데모 앱 타겟
    static func createDemoTarget(
        name: String,
        appConfiguration: AppConfiguration,
        demoConfiguration: DemoConfiguration
    ) -> Target {
        return Target.target(
            name: "\(name)Demo",
            destinations: appConfiguration.destination,
            product: .app,
            bundleId: "\(appConfiguration.bundleIdentifier).\(name.lowercased())Demo",
            deploymentTargets: appConfiguration.deploymentTarget,
            infoPlist: .extendingDefault(
                with: InfoPlist.demoPlist(demoConfiguration.disPlayName)
            ),
            sources: ["Demo/Sources/**"],
            resources: [.glob(pattern: "Demo/Resources/**", excluding: [])],
            dependencies: [.target(name: name)]
        )
    }
    
    /// 프레임워크 타겟 생성
    /// 모듈의 메인 구현체를 담당하는 프레임워크 타겟을 생성합니다.
    /// - Parameters:
    ///   - name: 모듈 이름
    ///   - configuration: 앱 설정 정보
    ///   - product: 프로덕트 타입 (framework, staticLibrary 등)
    ///   - hasResource: 리소스 파일 포함 여부 (기본값: false)
    ///   - dependencies: 의존성 배열
    /// - Returns: 프레임워크 타겟
    static func createFrameworkTarget(
        name: String,
        configuration: AppConfiguration,
        product: Product,
        hasResource: Bool = false,
        dependencies: [TargetDependency]
    ) -> Target {
        return Target.target(
            name: name,
            destinations: configuration.destination,
            product: product,
            bundleId: "\(configuration.bundleIdentifier).\(name.lowercased())",
            deploymentTargets: configuration.deploymentTarget,
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: hasResource ? [.glob(pattern: "Resources/**", excluding: [])] : [],
            dependencies: dependencies
        )
    }
    
    /// 인터페이스 타겟 생성
    /// 모듈의 의존성 인터페이스를 정의하는 타겟을 생성합니다.
    /// 다른 모듈들이 이 인터페이스에만 의존하여 구현체와 분리할 수 있습니다.
    /// - Parameters:
    ///   - name: 모듈 이름
    ///   - configuration: 앱 설정 정보
    ///   - product: 프로덕트 타입
    ///   - dependencies: 의존성 배열
    /// - Returns: 인터페이스 타겟
    static func createInterfaceTarget(
        name: String,
        configuration: AppConfiguration,
        product: Product,
        dependencies: [TargetDependency]
    ) -> Target {
        return Target.target(
            name: "\(name)Interface",
            destinations: configuration.destination,
            product: product,
            bundleId: "\(configuration.bundleIdentifier).\(name.lowercased())Interface",
            deploymentTargets: configuration.deploymentTarget,
            infoPlist: .default,
            sources: ["Interface/Sources/**"],
            dependencies: dependencies
        )
    }
    
    /// 테스트 타겟 생성
    /// 모듈의 단위 테스트를 위한 테스트 타겟을 생성합니다.
    /// - Parameters:
    ///   - name: 모듈 이름
    ///   - configuration: 앱 설정 정보
    ///   - dependencies: 테스트에 필요한 의존성 배열
    /// - Returns: 테스트 타겟
    static func createTestTarget(
        name: String,
        configuration: AppConfiguration,
        dependencies: [TargetDependency]
    ) -> Target {
        return Target.target(
            name: "\(name)Tests",
            destinations: configuration.destination,
            product: .unitTests,
            bundleId: "\(configuration.bundleIdentifier).\(name.lowercased())Tests",
            deploymentTargets: configuration.deploymentTarget,
            sources: ["Tests/Sources/**"],
            dependencies: dependencies
        )
    }
}
