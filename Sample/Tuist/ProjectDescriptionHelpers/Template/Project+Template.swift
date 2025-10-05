//
//  Project+Template.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

extension Project {
    /// 모듈 타입에 따라 Project를 구성하는 팩토리 메서드
    /// - Parameters:
    ///   - moduleType: 모듈 타입 (app, micro, module)
    ///   - product: 프로덕트 타입 (app, framework, etc.)
    ///   - dependencies: 의존성 배열
    ///   - interfaceDependencies: 인터페이스 의존성 배열 (기본값: 빈 배열)
    ///   - hasInterface: 인터페이스 모듈 포함 여부 (기본값: false)
    ///   - hasTests: 테스트 타겟 포함 여부 (기본값: false)
    ///   - hasResources: 리소스 파일 포함 여부 (기본값: false)
    ///   - demoConfiguration: 데모 구성 여부 (기본값: disabled)
    /// - Returns: 구성된 Project 객체
    public static func configure(
        moduleType: ModuleType,
        product: Product,
        dependencies: [TargetDependency],
        interfaceDependencies: [TargetDependency] = [],
        hasInterface: Bool = false,
        hasTests: Bool = false,
        hasResources: Bool = false,
        demoConfiguration: DemoConfiguration = .disabled,
    ) -> Project {
        let configuration = AppConfiguration()
        
        switch moduleType {
        case .app:
            // 앱 프로젝트 구성
            return configureApp(
                configuration: configuration,
                dependencies: dependencies
            )
            
        case let .micro(name, demo):
            // 마이크로 피처 프로젝트 구성 (Feature 모듈)
            return configureMicroFeatureProject(
                appConfiguration: configuration,
                demoConfiguration: demo,
                product: product,
                name: name,
                organizationName: configuration.organizationName,
                dependencies: dependencies,
                settings: configuration.setting
            )
            
        case let .module(name):
            // 일반 모듈 프로젝트 구성 (Domain, Data, Core 등)
            return configureModule(
                configuration: configuration,
                demoConfiguration: demoConfiguration,
                name: name,
                product: product,
                hasResources: hasResources,
                hasTests: hasTests,
                hasInterface: hasInterface,
                dependencies: dependencies
            )
        }
    }
}
