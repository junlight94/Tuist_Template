//
//  Dependency+Domain.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import ProjectDescription

public extension TargetDependency.Domain {
    static let domain = domainDependency(target: "Domain")
    static let sample = domainDependency(target: "SampleDomain")
    static let my = domainDependency(target: "MyDomain")
}
