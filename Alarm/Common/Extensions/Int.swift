//
//  Int.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 03.05.2025.
//

import Foundation

extension Int {
    var spelled: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(for: self) ?? ""
    }
}
