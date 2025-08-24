//
//  Project+.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 8/20/25.
//

import ProjectDescription

extension Project {
    /// 앱 프로젝트 설정
    static func configureApp(
        configuration: AppConfiguration,
        dependencies: [TargetDependency]
    ) -> Self {
        let appTarget = Target.target(
            name: configuration.projectName,
            destinations: configuration.destination,
            product: .app,
            bundleId: configuration.bundleIdentifier,
            deploymentTargets: configuration.deploymentTarget,
            infoPlist: .extendingDefault(with: configuration.infoPlist),
            sources: ["Sources/**"],
            resources: [.glob(pattern: "Resources/**", excluding: [])],
            entitlements: configuration.entitlements,
            dependencies: dependencies,
            settings: configuration.setting
        )
        
        let appScheme = Scheme.configureAppScheme(
            schemeName: configuration.projectName
        )
        
        return Project(
            name: configuration.projectName,
            organizationName: configuration.organizationName,
            settings: configuration.setting,
            targets: [appTarget],
            schemes: appScheme
        )
    }
    
    /// 단순 모듈
    static func configureModule(
        configuration: AppConfiguration,
        name: String,
        product: Product,
        hasResources: Bool = false,
        hasTests: Bool = false,
        hasDemo: Bool = false,
        hasInterface: Bool = false,
        dependencies: [TargetDependency]
    ) -> Self {
        var targets: [Target] = []
        var schemes: [Scheme] = [Scheme.configureScheme(
            schemeName: name
        )]
        
        if hasInterface {
            let interfaceTarget = createInterfaceTarget(
                name: name,
                configuration: configuration,
                product: product,
                dependencies: dependencies
            )
            targets.append(interfaceTarget)
        }
        
        let frameworkTarget = createFrameworkTarget(
            name: name,
            configuration: configuration,
            product: product,
            dependencies: hasInterface ? [.target(name: "\(name)Interface")] : dependencies
        )
        targets.append(frameworkTarget)
        
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
        
        if hasDemo {
            let demoTarget = createDemoTarget(
                name: name,
                configuration: configuration
            )
            targets.append(demoTarget)
            schemes.append(Scheme.configureDemoAppScheme(schemeName: "\(name)Demo"))
        }
        
        return Project(
            name: name,
            organizationName: configuration.organizationName,
            settings: configuration.commonSettings,
            targets: targets,
            schemes: schemes
        )
    }
    
    /// MicroFeature Module
    static func configureMicroFeatureProject(
        configuration: AppConfiguration,
        product: Product,
        name: String,
        organizationName: String,
        dependencies: [TargetDependency],
        settings: Settings
    ) -> Project {
        
        // Interface 타겟
        let interfaceTarget = createInterfaceTarget(
            name: name,
            configuration: configuration,
            product: product,
            dependencies: dependencies
        )
        
        // Framework 타겟
        let frameworkTarget = createFrameworkTarget(
            name: name,
            configuration: configuration,
            product: product,
            dependencies: [
                .target(name: "\(name)Interface")
            ]
        )
        
        // Demo 타겟
        let demoTarget = createDemoTarget(
            name: name,
            configuration: configuration
        )
        
        // Test 타겟
        let testTarget = createFrameworkTarget(
            name: "\(name)Test",
            configuration: configuration,
            product: product,
            dependencies: [
                .target(name: "\(name)Interface")
            ]
        )
        
        // Tests 타겟
        let testsTarget = createTestTarget(
            name: name,
            configuration: configuration,
            dependencies: [
                .target(name: "\(name)Test"),
                .target(name: name)
            ]
        )
        
        let targets = [interfaceTarget, frameworkTarget, demoTarget, testsTarget, testTarget]
        
        let schemes = [
            Scheme.configureScheme(schemeName: name),
            Scheme.configureDemoAppScheme(schemeName: "\(name)Demo")
        ]
        
        // 프로젝트 생성
        return Project(
            name: name,
            organizationName: organizationName,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

// MARK: Create Target
extension Project {
    private static func createDemoTarget(
        name: String,
        configuration: AppConfiguration
    ) -> Target {
        return Target.target(
            name: "\(name)Demo",
            destinations: configuration.destination,
            product: .app,
            bundleId: "\(configuration.bundleIdentifier).\(name.lowercased())Demo",
            deploymentTargets: configuration.deploymentTarget,
            sources: ["Demo/Sources/**"],
            resources: [.glob(pattern: "Demo/Resources/**", excluding: [])],
            dependencies: [.target(name: name)]
        )
    }
    
    private static func createFrameworkTarget(
        name: String,
        configuration: AppConfiguration,
        product: Product,
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
            dependencies: dependencies
        )
    }
    
    private static func createInterfaceTarget(
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
