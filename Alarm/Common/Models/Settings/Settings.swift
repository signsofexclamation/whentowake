//
//  Settings.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 04.05.2025.
//

import Foundation

enum Settings {
    static var isShortcutSet: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isShortcutSet")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isShortcutSet")
        }
    }
}
