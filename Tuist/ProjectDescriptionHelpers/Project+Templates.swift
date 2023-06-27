import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform, additionalTargets: [String]) -> Project {
        var targets = makeAppTargets(
            name: name,
            platform: platform,
            dependencies: additionalTargets.map { TargetDependency.target(name: $0) }
        )
        targets += additionalTargets.flatMap { makeFrameworkTargets(name: $0, platform: platform) }
        
        return Project(
            name: name,
            organizationName: "tuist.io",
            options: .options(automaticSchemesOptions: .disabled),
            targets: targets,
            schemes: makeAppSchemes(appName: name)
        )
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform) -> [Target] {
        let sources = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "io.tuist.\(name)",
            infoPlist: .default,
            sources: ["Targets/\(name)/Sources/**"],
            resources: [],
            dependencies: []
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

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
        ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
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
}

extension Project {
    
    private static func makeAppSchemes(appName: String) -> [Scheme] {
        let developmentScheme = Scheme(
            name: "Development",
            shared: true,
            buildAction: .buildAction(targets: ["\(appName)"])
        )
        
        let stagingScheme = Scheme(
            name: "Staging",
            shared: true,
            buildAction: .buildAction(targets: ["\(appName)"])
        )
        
        let productionScheme = Scheme(
            name: "Production",
            shared: true,
            buildAction: .buildAction(targets: ["\(appName)"])
        )
        
        return [developmentScheme, stagingScheme, productionScheme]
    }
}
