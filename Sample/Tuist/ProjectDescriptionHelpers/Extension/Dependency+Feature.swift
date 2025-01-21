//
//  Dependency+Feature.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Features {
        public struct Root {}
        public struct Main {}
    }
}

public extension TargetDependency.Features {
    static func project(name: String) -> TargetDependency {
        return .project(target: name, path: .relativeToFeature(name))
    }
}

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
