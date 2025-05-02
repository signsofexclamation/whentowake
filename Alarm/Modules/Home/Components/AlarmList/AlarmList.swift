//
//  AlarmList.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 02.05.2025.
//

import SwiftUI
import SwiftData

struct AlarmList: View {
    private let alarms: [Alarm]
    
    init(for date: Date) {
        self.alarms = Alarm.options(for: date)
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            ForEach(self.alarms) { alarm in
                AlarmOption(alarm: alarm)
            }
        }
    }
}
