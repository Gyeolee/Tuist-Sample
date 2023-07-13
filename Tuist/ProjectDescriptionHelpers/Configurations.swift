//
//  Configurations.swift
//  ProjectDescriptionHelpers
//
//  Created by HanGyeol Lee on 2023/06/28.
//

import ProjectDescription

extension ConfigurationName {
    static var developmentDebug: ConfigurationName { configuration("Development-Debug") }
    static var developmentRelease: ConfigurationName { configuration("Development-Release") }
    static var stagingDebug: ConfigurationName { configuration("Staging-Debug") }
    static var stagingRelease: ConfigurationName { configuration("Staging-Release") }
    static var productionDebug: ConfigurationName { configuration("Production-Debug") }
    static var productionRelease: ConfigurationName { configuration("Production-Release") }
}

private let basePath: String = "Projects/TuistSample/Config"

public let appConfigurations: [Configuration] = [
    .debug(name: .developmentDebug, settings: debugBaseSettings, xcconfig: .relativeToRoot("\(basePath)/Development/Development.xcconfig")),
    .debug(name: .stagingDebug, settings: debugBaseSettings, xcconfig: .relativeToRoot("\(basePath)/Staging/Staging.xcconfig")),
    .debug(name: .productionDebug, settings: debugBaseSettings, xcconfig: .relativeToRoot("\(basePath)/Production/Production.xcconfig")),
    .release(name: .developmentRelease, xcconfig: .relativeToRoot("\(basePath)/Development/Development.xcconfig")),
    .release(name: .stagingRelease, xcconfig: .relativeToRoot("\(basePath)/Staging/Staging.xcconfig")),
    .release(name: .productionRelease, xcconfig: .relativeToRoot("\(basePath)/Production/Production.xcconfig"))
]

public let frameworkConfigurations: [Configuration] = [
    .debug(name: .developmentDebug),
    .debug(name: .stagingDebug),
    .debug(name: .productionDebug),
    .release(name: .developmentRelease),
    .release(name: .stagingRelease),
    .release(name: .productionRelease)
]
