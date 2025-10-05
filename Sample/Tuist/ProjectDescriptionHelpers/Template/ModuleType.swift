//
//  ModuleType.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import Foundation

public enum ModuleType {
    case app
    case micro(name: String, demo: DemoConfiguration)
    case module(name: String)
}

public enum DemoConfiguration {
    case disabled
    case enabled(displayName: String)
    
    var isEnabled: Bool {
        switch self {
        case .enabled:
            return true
        case .disabled:
            return false
        }
    }
    
    var disPlayName: String {
        switch self {
        case .enabled(displayName: let name):
            return name
        case .disabled:
            return "None"
        }
    }
}
