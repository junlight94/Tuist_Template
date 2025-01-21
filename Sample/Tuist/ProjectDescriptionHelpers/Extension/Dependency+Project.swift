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
