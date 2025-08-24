//
//  service.swift
//  Config
//
//  Created by Junyoung on 1/24/25.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Feature module template",
    attributes: [
        nameAttribute
    ],
    items: [
        // MARK: Project
        .file(path: "\(nameAttribute)Feature/Project.swift",
              templatePath: "../stencil/Feature/featureProject.stencil"),
        
        // MARK: Sources
        .file(path: "\(nameAttribute)Feature/Sources/Sample.swift",
              templatePath: "../stencil/sample.stencil"),
        
        // MARK: Tests
        .file(path: "\(nameAttribute)Feature/Tests/Sources/Sample.swift",
              templatePath: "../stencil/Feature/featureTests.stencil"),
        
        // MARK: Test
        .file(path: "\(nameAttribute)Feature/Test/Sources/Sample.swift",
              templatePath: "../stencil/sample.stencil"),
        
        // MARK: Demo
        .file(path: "\(nameAttribute)Feature/Demo/Resources/Sample.swift",
              templatePath: "../stencil/sample.stencil"),
        .file(path: "\(nameAttribute)Feature/Demo/Sources/AppDelegate.swift",
              templatePath: "../stencil/appDelegate.stencil"),
        .file(path: "\(nameAttribute)Feature/Demo/Sources/\(nameAttribute)App.swift",
              templatePath: "../stencil/app.stencil"),
        
        // MARK: Interface
        .file(path: "\(nameAttribute)Feature/Interface/Sources/\(nameAttribute)Feature.swift",
              templatePath: "../stencil/sample.stencil")
    ]
)
