//
//  Configurations.swift
//  ProjectDescriptionHelpers
//
//  Created by HanGyeol Lee on 2023/06/28.
//

import ProjectDescription

extension ConfigurationName {
    static var debugDevelopment: ConfigurationName { configuration("Debug-Development") }
    static var debugStaging: ConfigurationName { configuration("Debug-Staging") }
    static var debugProduction: ConfigurationName { configuration("Debug-Production") }
    
    static var releaseDevelopment: ConfigurationName { configuration("Release-Development") }
    static var releaseStaging: ConfigurationName { configuration("Release-Staging") }
    static var releaseProduction: ConfigurationName { configuration("Release-Production") }
}

private let basePath: String = "Projects/TuistSample/Config"

let configurations: [Configuration] = [
    .debug(name: .debugDevelopment, xcconfig: .relativeToRoot("\(basePath)/Development/Development.xcconfig")),
    .debug(name: .debugStaging, xcconfig: .relativeToRoot("\(basePath)/Staging/Staging.xcconfig")),
    .debug(name: .debugProduction, xcconfig: .relativeToRoot("\(basePath)/Production/Production.xcconfig")),
    .release(name: .releaseDevelopment, xcconfig: .relativeToRoot("\(basePath)/Development/Development.xcconfig")),
    .release(name: .releaseStaging, xcconfig: .relativeToRoot("\(basePath)/Staging/Staging.xcconfig")),
    .release(name: .releaseProduction, xcconfig: .relativeToRoot("\(basePath)/Production/Production.xcconfig"))
]

let targetBaseSettings: [String: SettingValue] = [
    "PRODUCT_BUNDLE_IDENTIFIER": "$(inherited)",
    "PRODUCT_NAME": "$(inherited)"
]
