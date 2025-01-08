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
    
    let projectName: String = "TestProject"
    let shortVersion: String = "1.0.0"
    let bundleIdentifier: String = "com.test.project"
    let displayName: String = "트위스트"
    let destination: Set<Destination> = [.iPhone, .iPad]
    var entitlements: Entitlements? = nil
    let deploymentTarget: DeploymentTargets = .iOS("16.0")
    public var configurationName: ConfigurationName {
        return "TestProject"
    }
    
    var infoPlist: [String : Plist.Value] {
        InfoPlist.appInfoPlist(self)
    }
    
    public var autoCodeSigning: SettingsDictionary {
        return SettingsDictionary().automaticCodeSigning(devTeam: "DD8KP9C4KQ")
    }
    
    var setting: Settings {
        return Settings.settings(
            base: autoCodeSigning,
            configurations: XCConfig.project
        )
    }
}
