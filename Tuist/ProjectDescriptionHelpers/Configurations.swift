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

let configurations: [Configuration] = [
    .debug(name: .debugDevelopment),
    .debug(name: .debugStaging),
    .debug(name: .debugProduction),
    .release(name: .releaseDevelopment),
    .release(name: .releaseStaging),
    .release(name: .releaseProduction)
]
