//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription

public extension TargetDependency {
    struct Modules {}
    struct Core {}
    struct Umbrella {}
}

public extension TargetDependency.Modules {
    static var data: TargetDependency {
        TargetDependency.project(
            target: "Data",
            path: .relativeData()
        )
    }
    
    static var shared: TargetDependency {
        TargetDependency.project(
            target: "Shared",
            path: .relativeToModule(path: "Shared")
        )
    }
    
    static var networker: TargetDependency {
        TargetDependency.project(
            target: "Networker",
            path: .relativeToModule(path: "Networker")
        )
    }
}

public extension TargetDependency.Core {
    static var designKit: TargetDependency {
        TargetDependency.project(
            target: "DesignKit",
            path: .relativeToCore(path: "DesignKit")
        )
    }
    
    static var core: TargetDependency {
        TargetDependency.project(
            target: "Core",
            path: .relativeToCore(path: "Core")
        )
    }
}

public extension TargetDependency.Umbrella {
    static let umbrella = TargetDependency.project(
        target: "Umbrella",
        path: .relativeUmbrella()
    )
}
