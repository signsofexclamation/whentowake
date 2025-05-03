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
