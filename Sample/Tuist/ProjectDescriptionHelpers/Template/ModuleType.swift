//
//  ModuleType.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import Foundation

public enum FeatureType {
    case standard
    case micro
}

public enum ModuleType {
    case app
    case micro(name: String)
    case module(name: String)
}
