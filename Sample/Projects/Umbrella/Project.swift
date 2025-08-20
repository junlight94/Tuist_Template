//
//  Project.swift
//  Config
//
//  Created by Junyoung on 1/19/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .module(name: "Umbrella"),
    product: .framework,
    dependencies: [
        .Feature.root,
        .Module.data
    ],
    hasTests: false
)
