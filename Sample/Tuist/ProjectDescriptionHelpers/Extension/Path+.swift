//
//  Path+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToFeature(path: String) -> Self {
        return .relativeToRoot("Projects/Features/\(path)")
    }
    
    static func relativeToDomain(path: String) -> Self {
        return .relativeToRoot("Projects/Domains/\(path)")
    }
    
    static func relativeToModule(path: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(path)")
    }
    
    static func relativeToCore(path: String) -> Self {
        return .relativeToRoot("Projects/CoreKit/\(path)")
    }
    
    static func relativeData() -> Self {
        return .relativeToRoot("Projects/Data/Data")
    }
    
    static func relativShared() -> Self {
        return .relativeToRoot("Projects/Modules/Shared")
    }
    
    static func relativeUmbrella() -> Self {
        return .relativeToRoot("Projects/Umbrella")
    }
}
