//
//  AlarmOption.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI

struct AlarmOption: View {
    private let alarm: Alarm
    
    init(alarm: Alarm) {
        self.alarm = alarm
    }
    
    var body: some View {
        VStack(spacing: 16.0) {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(self.alarm.date.time)
                    .font(.timesNewRoman(size: 48.0))
                    .foregroundStyle(.primary)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("four sleep cycles. 5.5 hrs of sleep.")
                        .font(.timesNewRoman(size: 12.0))
                        .foregroundStyle(.secondary)
                    
                    Text(self.alarm.sleep.info)
                        .font(.timesNewRoman(size: 16.0))
                        .foregroundStyle(.primary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlarmOption(alarm: .init(date: .now, sleep: .minimal))
}
