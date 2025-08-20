//
//  Project.swift
//  Config
//
//  Created by Junyoung on 1/9/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .module(name: "Data"),
    product: .staticFramework,
    dependencies: [
        .Modules.networker,
        .Domains.domain,
    ]
)
