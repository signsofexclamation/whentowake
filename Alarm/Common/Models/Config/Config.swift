//
//  Config.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 04.05.2025.
//

import Foundation

struct Config: Decodable {
    enum CodingKeys: String, CodingKey {
        case shortcutURL = "SHORTCUT_URL"
        case sourceCodeURL = "SOURCE_CODE_URL"
        case websiteURL = "WEBSITE_URL"
    }
    
    enum Error: LocalizedError {
        case notFound
        
        var errorDescription: String? {
            switch self {
            case .notFound:
                return "Configuration file not found."
            }
        }
    }
    
    let shortcutURL: String
    let sourceCodeURL: String
    let websiteURL: String
    
    var appVersion: String {
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    static let standard: Config = {
        do {
            guard let filePath = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
                throw Error.notFound
            }
            
            let data = try Data(contentsOf: filePath)
            return try PropertyListDecoder().decode(Config.self, from: data)
        } catch {
            fatalError("Failed to decode configuration file: \(error.localizedDescription)")
        }
    }()
}
