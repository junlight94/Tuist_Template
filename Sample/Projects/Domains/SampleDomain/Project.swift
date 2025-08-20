import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.configure(
    moduleType: .module(name: "SampleDomain"),
    product: .staticFramework,
    dependencies: [
        .Module.shared
    ],
    hasTests: true
)
