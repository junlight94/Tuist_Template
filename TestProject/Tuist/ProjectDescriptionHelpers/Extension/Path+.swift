//
//  Path+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/Features/\(path)")
    }
    
    static func relativeToModule(_ path: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(path)")
    }
    
    static func relativeToCore(_ path: String) -> Self {
        return .relativeToRoot("Projects/CoreKit/\(path)")
    }
    
    static var data: Self {
        return .relativeToRoot("Projects/Data")
    }
    
    static var domain: Self {
        return .relativeToRoot("Projects/Domain")
    }
    
    static var shared: Self {
        return .relativeToRoot("Projects/Shared")
    }
}
