//
//  TargetDependency+.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 8/20/25.
//

import ProjectDescription

// MARK: - Base Dependency Protocol
/// 의존성을 생성하는 기본 프로토콜
public protocol DependencyProvider {
    static func dependency(target: String, path: Path) -> TargetDependency
    
    static func domainDependency(target: String) -> TargetDependency
    static func domainInterfaceDependency(target: String) -> TargetDependency
    
    static func featureDependency(target: String) -> TargetDependency
    static func featureInterfaceDependency(target: String) -> TargetDependency
}

public extension DependencyProvider {
    static func dependency(target: String, path: Path) -> TargetDependency {
        return .project(
            target: target,
            path: path
        )
    }
    
    static func domainDependency(target: String) -> TargetDependency {
        return .project(
            target: target,
            path: .relativeToDomain(path: target)
        )
    }
    
    static func domainInterfaceDependency(target: String) -> TargetDependency {
        return .project(
            target: "\(target)Interface",
            path: .relativeToDomain(path: target)
        )
    }
    
    static func featureDependency(target: String) -> TargetDependency {
        return .project(
            target: target,
            path: .relativeToFeature(path: target)
        )
    }
    
    static func featureInterfaceDependency(target: String) -> TargetDependency {
        return .project(
            target: "\(target)Interface",
            path: .relativeToFeature(path: target)
        )
    }
}

// MARK: - Module Categories
public extension TargetDependency {
    /// 외부 라이브러리 의존성
    struct Library: DependencyProvider {}
    
    /// 핵심 모듈 의존성 (Core, DesignKit 등)
    struct Core: DependencyProvider {}
    
    /// 비즈니스 로직 모듈 의존성
    struct Module: DependencyProvider {}
    
    /// 도메인 레이어 의존성
    struct Domain: DependencyProvider {
        static let domain = Domain.self
        
        private static let name = "Domain"
        public static let implement = domainDependency(target: name)
        public static let interface = domainInterfaceDependency(target: name)
    }
    
    /// 피처 레이어 의존성
    struct Feature: DependencyProvider {}
    
    /// 앱 레벨 의존성
    struct App: DependencyProvider {}
}
