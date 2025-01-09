//
//  Dependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription

public typealias Dependency = TargetDependency

public extension Dependency {
    struct Features {
        public struct Main {}
    }
}

public extension Dependency.Features {
    static func project(name: String) -> Dependency {
        return .project(target: name, path: .relativeToFeature(name))
    }
}

public extension Dependency.Features.Main {
    static let name = "Main"
    
    static let Feature = Dependency.Features.project(name: "\(name)Feature")
    static let Interface = Dependency.project(target: "\(name)FeatureInterface", path: .relativeToFeature("\(name)Feature"))
}
