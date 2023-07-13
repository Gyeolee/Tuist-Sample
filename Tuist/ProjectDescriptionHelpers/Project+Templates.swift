import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    public static func app(name: String,
                           platform: Platform,
                           additionalTargets: [String],
                           dependencies: [TargetDependency] = []) -> Project {
        var targets = makeAppTargets(
            name: name,
            platform: platform,
            dependencies: additionalTargets.map { TargetDependency.target(name: $0) } + dependencies
        )
        targets += additionalTargets.flatMap {
            makeFrameworkTargets(name: $0, platform: platform, dependencies: dependencies)
        }
        
        return Project(
            name: name,
            organizationName: "tuist.io",
            options: .options(automaticSchemesOptions: .disabled),
            settings: .settings(configurations: appConfigurations),
            targets: targets,
            schemes: makeAppSchemes(appName: name)
        )
    }
    
    public static func framework(name: String,
                                 platform: Platform,
                                 additionalTargets: [String]) -> Project {
        let target = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "io.tuist.\(name)",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        )
        
        return Project(
            name: name,
            organizationName: "tuist.io",
            options: .options(automaticSchemesOptions: .disabled),
            settings: .settings(configurations: frameworkConfigurations),
            targets: [target],
            resourceSynthesizers: [
                .fonts()
            ]
        )
    }
}

extension Project {
    
    // MARK: - Targets
    
    private static func makeAppTargets(name: String,
                                       platform: Platform,
                                       dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "API_BASE_URL": "$(API_BASE_URL)"
        ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies,
            settings: .settings(base: appTargetBaseSettings, configurations: appConfigurations)
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [.target(name: "\(name)")]
        )
        
        return [mainTarget]
    }

    private static func makeFrameworkTargets(name: String,
                                             platform: Platform,
                                             dependencies: [TargetDependency]) -> [Target] {
        let sources = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "io.tuist.\(name)",
            infoPlist: .default,
            sources: ["Targets/\(name)/Sources/**"],
            resources: [],
            dependencies: dependencies
        )
        
        let tests = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            resources: [],
            dependencies: [.target(name: name)]
        )
        
        return [sources]
    }
}

extension Project {
    
    // MARK: Schemes
    
    private static func makeAppSchemes(appName: String) -> [Scheme] {
        let developmentScheme = Scheme(
            name: "Development",
            shared: true,
            buildAction: .buildAction(targets: ["\(appName)"]),
            testAction: .targets([], configuration: .developmentDebug),
            runAction: .runAction(configuration: .developmentDebug),
            archiveAction: .archiveAction(configuration: .developmentRelease),
            profileAction: .profileAction(configuration: .developmentRelease),
            analyzeAction: .analyzeAction(configuration: .developmentDebug)
        )
        
        let stagingScheme = Scheme(
            name: "Staging",
            shared: true,
            buildAction: .buildAction(targets: ["\(appName)"]),
            testAction: .targets([], configuration: .stagingDebug),
            runAction: .runAction(configuration: .stagingDebug),
            archiveAction: .archiveAction(configuration: .stagingRelease),
            profileAction: .profileAction(configuration: .stagingRelease),
            analyzeAction: .analyzeAction(configuration: .stagingDebug)
        )
        
        let productionScheme = Scheme(
            name: "Production",
            shared: true,
            buildAction: .buildAction(targets: ["\(appName)"]),
            testAction: .targets([], configuration: .productionDebug),
            runAction: .runAction(configuration: .productionDebug),
            archiveAction: .archiveAction(configuration: .productionRelease),
            profileAction: .profileAction(configuration: .productionRelease),
            analyzeAction: .analyzeAction(configuration: .productionDebug)
        )
        
        return [developmentScheme, stagingScheme, productionScheme]
    }
}
