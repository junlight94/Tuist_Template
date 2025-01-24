//
//  Path+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToFeature(path: String, service: ServiceType) -> Self {
        return .relativeToRoot("Projects/\(service.rawValue)/Features/\(path)")
    }
    
    static func relativeToDomain(path: String, service: ServiceType) -> Self {
        return .relativeToRoot("Projects/\(service.rawValue)/Domains/\(path)")
    }
    
    static func relativeToModule(path: String, service: ServiceType) -> Self {
        return .relativeToRoot("Projects/\(service.rawValue)/Modules/\(path)")
    }
    
    static func relativeToCore(path: String, service: ServiceType) -> Self {
        return .relativeToRoot("Projects/\(service.rawValue)/CoreKit/\(path)")
    }
    
    static func releativeData(_ service: ServiceType) -> Self {
        return .relativeToRoot("Projects/\(service.rawValue)/Data/Data")
    }
    
    static func releativShared(_ service: ServiceType) -> Self {
        return .relativeToRoot("Projects/\(service.rawValue)/Shared")
    }
    
    static func relativeUmbrella() -> Self {
        return .relativeToRoot("Projects/Umbrella")
    }
}
