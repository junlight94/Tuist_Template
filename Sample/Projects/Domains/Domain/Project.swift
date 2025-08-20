//
//  Project.swift
//  Config
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .module(name: "Domain"),
    product: .staticFramework,
    dependencies: [
        .Domain.sample,
    ]
)
