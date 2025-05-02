//
//  Alarm.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import Foundation
import SwiftData

struct Alarm: Identifiable, Hashable {
    let date: Date
    let sleep: Sleep
    
    var id: Int {
        return self.hashValue
    }
    
    init(date: Date, sleep: Sleep) {
        self.date = date
        self.sleep = sleep
    }
}

extension Alarm {
    static func options(for date: Date) -> [Alarm] {
        let sleepStartDate = date.adding(.minute, value: 15) ?? date + 15 * 60
        let sleepOptions: [Sleep] = [.minimal, .medium, .best]
        
        var alarmOptions: [Alarm] = []
        
        for sleep in sleepOptions {
            let wakeupDate = sleepStartDate.adding(.minute, value: sleep.duration) ?? sleepStartDate + TimeInterval(sleep.duration * 60)
            alarmOptions.append(.init(date: wakeupDate, sleep: sleep))
        }
        
        return alarmOptions
    }
}
