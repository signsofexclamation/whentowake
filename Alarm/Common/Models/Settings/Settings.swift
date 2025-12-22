//
//  Settings.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 04.05.2025.
//

import Foundation
import AlarmKit

enum Settings {
    static var isAlarmAuthorized: Bool {
        return AlarmManager.shared.authorizationState == .authorized
    }
}
