//
//  service.swift
//  Config
//
//  Created by Junyoung on 1/24/25.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Domain module template",
    attributes: [
        nameAttribute
    ],
    items: [
        // MARK: Project
        .file(
            path: "\(nameAttribute)Domain/Project.swift",
            templatePath: "../stencil/domainProject.stencil"
        ),
        
        // MARK: Sources
        .file(
            path: "\(nameAttribute)Domain/Sources/Sample.swift",
            templatePath: "../stencil/sample.stencil"
        ),
        
        // MARK: Tests
        .file(
            path: "\(nameAttribute)Domain/Tests/Sources/\(nameAttribute)Tests.swift",
            templatePath: "../stencil/domainTests.stencil"
        ),
        
        // MARK: Interface
        .file(
            path: "\(nameAttribute)Domain/Interface/Sources/\(nameAttribute)UseCase.swift",
            templatePath: "../stencil/usecase.stencil"
        ),
    ]
)
