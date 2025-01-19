//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Features {
        public struct Root {}
        public struct Main {}
    }
    
    struct Modules {}
    struct Core {}
}

public extension TargetDependency.Modules {
    static let data = TargetDependency.project(target: "Data", path: .data)
    static let domain = TargetDependency.project(target: "Domain", path: .domain)
    
    static let shared = TargetDependency.project(target: "Shared", path: .relativeToModule("Shared"))
    static let networkModule = TargetDependency.project(target: "NetworkModule", path: .relativeToModule("NetworkModule"))
    static let thirdPartyLibrary = TargetDependency.project(target: "ThirdPartyLibrary", path: .relativeToModule("ThirdPartyLibrary"))
}

public extension TargetDependency.Core {
    static let designKit = TargetDependency.project(target: "DesignKit", path: .relativeToCore("DesignKit"))
    static let core = TargetDependency.project(target: "Core", path: .relativeToCore("Core"))
}

public extension TargetDependency.Features {
    static func project(name: String) -> TargetDependency {
        return .project(target: name, path: .relativeToFeature(name))
    }
}

// MARK: - Features
public extension TargetDependency.Features.Root {
    static let name = "Root"
    
    static let Feature = TargetDependency.Features.project(name: "\(name)Feature")
    static let Interface = TargetDependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}

public extension TargetDependency.Features.Main {
    static let name = "Main"
    
    static let Feature = TargetDependency.Features.project(name: "\(name)Feature")
    static let Interface = TargetDependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}
