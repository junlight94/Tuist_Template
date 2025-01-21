//
//  Project.swift
//  Config
//
//  Created by Junyoung on 1/19/25.
//

import Foundation

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .feature(name: "Root", type: .standard),
    product: .framework,
    dependencies: [
        .Features.Main.Feature
    ]
)
