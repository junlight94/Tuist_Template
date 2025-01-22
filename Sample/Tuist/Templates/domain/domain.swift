import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Feature module template",
    attributes: [
        nameAttribute
    ],
    items: [
        // MARK: Project
        .file(path: "\(nameAttribute)Domain/Project.swift",
              templatePath: "../stencil/domainProject.stencil"),
        
        // MARK: Sources
        .file(path: "\(nameAttribute)Domain/Sources/sample.swift",
              templatePath: "../stencil/sample.stencil"),
        
        // MARK: Tests
        .file(path: "\(nameAttribute)Domain/Tests/Sources/sample.swift",
              templatePath: "../stencil/sample.stencil"),
    ]
)

