//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription

public extension TargetDependency.Module {
    static let data = dependency(
        target: "Data",
        path: .relativeData()
    )
    
    static let shared = dependency(
        target: "Shared",
        path: .relativShared()
    )
    
    static let networker = dependency(
        target: "Networker",
        path: .relativeToModule(path: "Networker")
    )
}

public extension TargetDependency.Core {
    static let designKit = dependency(
        target: "DesignKit",
        path: .relativeToCore(path: "DesignKit")
    )
    
    static let core = dependency(
        target: "Core",
        path: .relativeToCore(path: "Core")
    )
}

public extension TargetDependency.App {
    static let umbrella = dependency(
        target: "Umbrella",
        path: .relativeUmbrella()
    )
}
