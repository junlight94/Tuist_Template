//
//  AppScheme.swift
//  TestProjectManifests
//
//  Created by Junyoung on 1/8/25.
//

import ProjectDescription

extension Scheme {
    static func configureAppScheme(
        schemeName: String
    ) -> [Scheme] {
        let developConfiguration: ConfigurationName = .configuration("Dev")
        let productionConfiguration: ConfigurationName = .configuration("Prod")
        
        let buildAction = BuildAction.buildAction(targets: [TargetReference(stringLiteral: schemeName)])
        
        return [
            Scheme.scheme(
                name: schemeName + "-Dev",
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: developConfiguration),
                archiveAction: .archiveAction(configuration: developConfiguration),
                profileAction: .profileAction(configuration: developConfiguration),
                analyzeAction: .analyzeAction(configuration: developConfiguration)
            ),
            Scheme.scheme(
                name: schemeName + "-Prod",
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: productionConfiguration),
                archiveAction: .archiveAction(configuration: productionConfiguration),
                profileAction: .profileAction(configuration: productionConfiguration),
                analyzeAction: .analyzeAction(configuration: productionConfiguration)
            )
        ]
    }
    
    static func configureDemoAppScheme(
        schemeName: String
    ) -> Scheme {
        let developConfiguration: ConfigurationName = .configuration("Dev")
        
        let buildAction = BuildAction.buildAction(targets: [TargetReference(stringLiteral: schemeName)])
        
        return Scheme.scheme(
            name: schemeName,
            shared: true,
            buildAction: buildAction,
            runAction: .runAction(configuration: developConfiguration),
            archiveAction: .archiveAction(configuration: developConfiguration),
            profileAction: .profileAction(configuration: developConfiguration),
            analyzeAction: .analyzeAction(configuration: developConfiguration)
        )
    }
    
    static func configureScheme(
        schemeName: String
    ) -> Scheme {
        let configuration: ConfigurationName = .configuration("Dev")
        
        let buildAction = BuildAction.buildAction(targets: [TargetReference(stringLiteral: schemeName)])
        
        return Scheme.scheme(
                name: schemeName,
                shared: true,
                buildAction: buildAction,
                runAction: .runAction(configuration: configuration),
                archiveAction: .archiveAction(configuration: configuration),
                profileAction: .profileAction(configuration: configuration),
                analyzeAction: .analyzeAction(configuration: configuration)
        )
    }
}
