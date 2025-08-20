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
        interfaceDependencies: [TargetDependency] = [],
        hasTests: Bool = true,
        hasResources: Bool = false
    ) -> Project {
        let configuration = AppConfiguration()
        
        switch moduleType {
        case .app:
            return configureApp(
                configuration: configuration,
                dependencies: dependencies
            )
            
        case let .micro(name):
            return configureMicroFeatureProject(
                configuration: configuration,
                product: product,
                name: name,
                organizationName: configuration.organizationName,
                dependencies: dependencies,
                settings: configuration.setting
            )
            
        case let .module(name):
            return configureModule(
                configuration: configuration,
                moduleName: name,
                product: product,
                hasResources: hasResources,
                hasTests: hasTests,
                dependencies: dependencies
            )
        }
    }
}
