//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .micro(name: "MainFeature"),
    product: .staticFramework,
    dependencies: [
        .Core.core
    ]
)
