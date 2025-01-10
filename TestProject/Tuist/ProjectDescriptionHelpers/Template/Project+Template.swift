//
//  Project+Template.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

extension Project {
    public static func configure(
        moduleType: ModuleType,
        product: Product,
        dependencies: [TargetDependency],
        hasResources: Bool = false
    ) -> Project {
        
        var targets: [Target] = []
        var schemes: [Scheme] = []
        let configuration = AppConfiguration()
        
        switch moduleType {
        case .app:
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
            targets.append(appTarget)
            
            let appScheme = Scheme.configureAppScheme(
                schemeName: configuration.projectName
            )
            schemes = appScheme
            
            return Project(
                name: configuration.projectName,
                organizationName: configuration.organizationName,
                settings: configuration.setting,
                targets: targets,
                schemes: schemes
            )
        case let .feature(name: name):
            let featureTargetName = "\(name)Feature"
            
            let featureTarget = Target.target(
                name: featureTargetName,
                destinations: configuration.destination,
                product: product,
                bundleId: "\(configuration.bundleIdentifier).feature.\(name.lowercased())",
                deploymentTargets: configuration.deploymentTarget,
                sources: ["Sources/**"],
                dependencies: dependencies
            )
            targets.append(featureTarget)
            
            let testTargetName = "\(featureTargetName)Tests"
            let testTarget = Target.target(
                name: testTargetName,
                destinations: configuration.destination,
                product: .unitTests,
                bundleId: "\(configuration.bundleIdentifier).feature.\(name.lowercased()).test",
                deploymentTargets: configuration.deploymentTarget,
                sources: ["Tests/Sources/**"],
                dependencies: [.target(name: featureTargetName)]
            )
            targets.append(testTarget)
            
            let featureScheme = Scheme.configureScheme(
                schemeName: featureTargetName
            )
            schemes.append(featureScheme)
            
            return Project(
                name: featureTargetName,
                organizationName: configuration.organizationName,
                settings: configuration.commonSettings,
                targets: targets,
                schemes: schemes
            )
        case let .module(name, path):
            let moduleTarget = Target.target(
                name: name,
                destinations: configuration.destination,
                product: product,
                bundleId: "\(configuration.bundleIdentifier).\(name.lowercased())",
                deploymentTargets: configuration.deploymentTarget,
                sources: ["Sources/**"],
                resources: hasResources ? ["Resources/**"] : [],
                dependencies: dependencies
            )
            targets.append(moduleTarget)
            
            let testTargetName = "\(name)Tests"
            let testTarget = Target.target(
                name: testTargetName,
                destinations: configuration.destination,
                product: .unitTests,
                bundleId: "\(configuration.bundleIdentifier).\(name.lowercased()).test",
                deploymentTargets: configuration.deploymentTarget,
                sources: ["Sources/**"],
                dependencies: [.target(name: name)]
            )
            targets.append(testTarget)
            
            let moduleScheme = Scheme.configureScheme(
                schemeName: name
            )
            
            schemes.append(moduleScheme)
            
            return Project(
                name: name,
                organizationName: configuration.organizationName,
                settings: configuration.commonSettings,
                targets: targets,
                schemes: schemes
            )
        }
    }
}
