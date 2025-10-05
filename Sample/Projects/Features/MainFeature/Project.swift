//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .micro(
        name: "MainFeature",
        demo: .enabled(displayName: "메인 데모앱")
    ),
    product: .staticFramework,
    dependencies: [
        .Core.core
    ]
)
