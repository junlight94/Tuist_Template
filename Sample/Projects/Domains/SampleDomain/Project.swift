//
//  Project.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import Foundation

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .domain(name: "SampleDomain"),
    product: .framework,
    dependencies: [
        .Modules.shared
    ]
)
