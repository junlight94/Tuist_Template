//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Features {
        public struct Main {}
    }
    
    struct Modules {}
    struct Core {}
}

public extension TargetDependency.Modules {
    static let data = TargetDependency.project(target: "Data", path: .data)
    static let domain = TargetDependency.project(target: "Domain", path: .domain)
    static let shared = TargetDependency.project(target: "Shared", path: .shared)
    
    static let networkModule = TargetDependency.project(target: "NetworkModule", path: .relativeToModule("NetworkModule"))
}

public extension TargetDependency.Core {
    static let designKit = TargetDependency.project(target: "DesignKit", path: .relativeToCore("DesignKit"))
}

public extension TargetDependency.Features {
    static func project(name: String) -> TargetDependency {
        return .project(target: name, path: .relativeToFeature(name))
    }
}

public extension TargetDependency.Features.Main {
    static let name = "Main"
    
    static let Feature = TargetDependency.Features.project(name: "\(name)Feature")
    static let Interface = TargetDependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}
