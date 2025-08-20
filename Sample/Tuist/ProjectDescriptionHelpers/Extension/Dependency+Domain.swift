//
//  Dependency+Domain.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Domains {
        public struct My {}
        public struct Sample {}
        public struct Domain {}
    }
}

public extension TargetDependency.Domains {
    static func project(name: String) -> TargetDependency {
        return .project(
            target: name,
            path: .relativeToDomain(path: name)
        )
    }
    
    static var domain: TargetDependency {
        TargetDependency.Domains.project(
            name: "Domain"
        )
    }
}

public extension TargetDependency.Domains.Domain {
    static let name = "Domain"
    
    static let domain = TargetDependency.Domains.project(
        name: "\(name)"
    )
}

public extension TargetDependency.Domains.Sample {
    static let name = "Sample"
    
    static let domain = TargetDependency.Domains.project(
        name: "\(name)Domain"
    )
}

public extension TargetDependency.Domains.My {
    static let name = "My"
    
    static let domain = TargetDependency.Domains.project(
        name: "\(name)Domain"
    )
}
