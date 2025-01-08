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
        dependencies: [TargetDependency]
    ) -> Project {
        
        var targets: [Target] = []
        var schemes: [Scheme] = []
        
        switch moduleType {
        case let .app(configuration):
            
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
            
            let appScheme = Scheme.configureScheme(
                configurationName: configuration.configurationName,
                schemeName: configuration.projectName,
                codeCoverageTargets: [configuration.projectName]
            )
            schemes = appScheme
            
            return Project(
                name: configuration.projectName,
                settings: configuration.setting,
                targets: targets,
                schemes: schemes
            )
        }
    }
}
