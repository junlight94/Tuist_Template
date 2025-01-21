//
//  Dependency+Domain.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Domains {
        public struct Sample {}
    }
}

public extension TargetDependency.Domains {
    static func project(name: String) -> TargetDependency {
        return .project(target: name, path: .relativeToDomain(name))
    }
}

public extension TargetDependency.Domains.Sample {
    static let name = "Sample"
    
    static let Domain = TargetDependency.Domains.project(name: "\(name)Domain")
}
