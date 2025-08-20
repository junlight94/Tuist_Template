//
//  Dependency+Feature.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import ProjectDescription

public extension TargetDependency.Feature {
    static let root = featureDependency(target: "RootFeature")
    static let main = featureDependency(target: "MainFeature")
}
