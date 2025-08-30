//
//  Dependency+Feature.swift
//  Config
//
//  Created by Junyoung Lee on 1/21/25.
//

import ProjectDescription

public extension TargetDependency.Feature {
    struct Main {
        private static let name = "MainFeature"
        public static let feature = featureDependency(target: name)
        public static let interface = featureInterfaceDependency(target: name)
    }
    
    struct Root {
        private static let name = "RootFeature"
        public static let feature = featureDependency(target: name)
        public static let interface = featureInterfaceDependency(target: name)
    }
}
