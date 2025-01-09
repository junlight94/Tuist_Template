//
//  ModuleType.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import Foundation

public enum ModuleType {
    case app
    case feature(name: String)
    case module(name: String)
}
