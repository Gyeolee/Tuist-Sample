//
//  Environment.swift
//  TuistSampleKit
//
//  Created by Hangyeol on 2023/07/03.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

public enum Environment {
    
    private enum Keys: String {
        case apiBaseUrl = "API_BASE_URL"
    }
    
    private static let infoDictionary: [String: Any] = Bundle.main.infoDictionary!
    
    static let apiBaseUrl: URL = .init(string: infoDictionary[Keys.apiBaseUrl.rawValue] as! String)!
}
