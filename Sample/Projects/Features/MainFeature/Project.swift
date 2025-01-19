//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .feature(name: "Main"),
    product: .framework,
    dependencies: [
        .Core.core
    ]
)