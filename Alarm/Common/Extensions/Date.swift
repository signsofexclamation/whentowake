//
//  Date.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import Foundation

extension Date {
    var time: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        
        return String(format: "%02d:%02d", hour, minutes)
    }
    
    var year: String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        
        return String(year)
    }
    
    func adding(_ component: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }
}
