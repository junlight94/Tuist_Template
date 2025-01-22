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
              templatePath: "../stencil/featureProject.stencil"),
        
        // MARK: Sources
        .file(path: "\(nameAttribute)Feature/Sources/sample.swift",
              templatePath: "../stencil/sample.stencil"),
        
        // MARK: Tests
        .file(path: "\(nameAttribute)Feature/Tests/Sources/sample.swift",
              templatePath: "../stencil/sample.stencil"),
        
        // MARK: Test
        .file(path: "\(nameAttribute)Feature/Test/Sources/sample.swift",
              templatePath: "../stencil/sample.stencil"),
        
        // MARK: Demo
        .file(path: "\(nameAttribute)Feature/Demo/Resources/sample.swift",
              templatePath: "../stencil/sample.stencil"),
        .file(path: "\(nameAttribute)Feature/Demo/Sources/AppDelegate.swift",
              templatePath: "../stencil/appDelegate.stencil"),
        .file(path: "\(nameAttribute)Feature/Demo/Sources/App.swift",
              templatePath: "../stencil/app.stencil"),
        
        // MARK: Interface
        .file(path: "\(nameAttribute)Feature/Interface/Sources/sample.swift",
              templatePath: "../stencil/sample.stencil")
    ]
)
