// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "SnapKit": .framework,
            "Swinject": .framework
        ],
        baseSettings: Settings.settings(configurations: XCConfig.project)
    )
#endif

let package = Package(
    name: "Sample",
    platforms: [.iOS(.v16)],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.7.1"),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.10.0")
    ]
)
