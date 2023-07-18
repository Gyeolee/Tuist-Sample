//
//  Settings.swift
//  ProjectDescriptionHelpers
//
//  Created by HanGyeol Lee on 2023/07/13.
//

import ProjectDescription

public let appTargetBaseSettings: SettingsDictionary = [
    "INFOPLIST_KEY_CFBundleDisplayName": "$(inherited)",
    "GENERATE_INFOPLIST_FILE": "$(inherited)",
    "API_BASE_URL": "$(inherited)"
]

public let debugBaseSettings: SettingsDictionary = [
    "OTHER_LDFLAGS": ["-all_load", "-Xlinker", "-interposable"]
]
