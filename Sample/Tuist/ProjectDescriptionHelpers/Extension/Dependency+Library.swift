//
//  Dependency+Library.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 1/9/25.
//

import ProjectDescription

public extension TargetDependency.Library {
    static let alamofire = TargetDependency.external(name: "Alamofire")
    static let swinject = TargetDependency.external(name: "Swinject")
}
