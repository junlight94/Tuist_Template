//
//  Project.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .app(AppConfiguration()),
    product: .app,
    dependencies: [
        
    ]
)
