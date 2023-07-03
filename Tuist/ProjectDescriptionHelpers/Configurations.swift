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

let configurations: [Configuration] = [
    .debug(name: .developmentDebug, settings: debugBaseSettings, xcconfig: .relativeToRoot("\(basePath)/Development/Development.xcconfig")),
    .debug(name: .stagingDebug, settings: debugBaseSettings, xcconfig: .relativeToRoot("\(basePath)/Staging/Staging.xcconfig")),
    .debug(name: .productionDebug, settings: debugBaseSettings, xcconfig: .relativeToRoot("\(basePath)/Production/Production.xcconfig")),
    .release(name: .developmentRelease, xcconfig: .relativeToRoot("\(basePath)/Development/Development.xcconfig")),
    .release(name: .stagingRelease, xcconfig: .relativeToRoot("\(basePath)/Staging/Staging.xcconfig")),
    .release(name: .productionRelease, xcconfig: .relativeToRoot("\(basePath)/Production/Production.xcconfig"))
]

let targetBaseSettings: SettingsDictionary = [
    "PRODUCT_BUNDLE_IDENTIFIER": "$(inherited)",
    "INFOPLIST_KEY_CFBundleDisplayName": "$(inherited)",
    "GENERATE_INFOPLIST_FILE": "$(inherited)",
    "API_BASE_URL": "$(inherited)"
]

let debugBaseSettings: SettingsDictionary = [
    "OTHER_LDFLAGS": ["-all_load", "-Xlinker", "-interposable"]
]
