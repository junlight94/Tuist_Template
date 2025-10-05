//
//  XCConfig.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

public struct XCConfig {
    public static let project: [Configuration] = [
        .debug(name: "Dev", xcconfig: .project),
        .release(name: "Prod", xcconfig: .project)
    ]
}
