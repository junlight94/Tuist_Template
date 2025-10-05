//
//  AppConfiguration.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import Foundation
import ProjectDescription

public struct AppConfiguration {
    
    public init() {}
    
    let projectName: String = "Sample"
    let organizationName = "SampleCompany"
    let shortVersion: String = "1.0.0"
    let bundleIdentifier: String = "com.test.sample"
    let displayName: String = "트위스트"
    let destination: Set<Destination> = [.iPhone, .iPad]
    var entitlements: Entitlements? = nil
    let deploymentTarget: DeploymentTargets = .iOS("16.0")
    
    var setting: Settings {
        return Settings.settings(
            configurations: XCConfig.project
        )
    }
}
