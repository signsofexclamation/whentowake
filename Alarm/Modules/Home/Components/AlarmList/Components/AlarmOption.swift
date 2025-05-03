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
        HStack(spacing: 16.0) {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(self.alarm.date.time)
                    .font(.timesNewRoman(size: 48.0))
                    .foregroundStyle(.primary)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(self.alarm.sleep.details)
                        .font(.timesNewRoman(size: 12.0))
                        .foregroundStyle(.secondary)
                    
                    Text(self.alarm.sleep.description)
                        .font(.timesNewRoman(size: 16.0))
                        .foregroundStyle(.primary)
                }
                .tracking(.condensedTracking)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.forward")
                .font(.system(size: 18.0))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlarmOption(alarm: .init(date: .now, sleep: .medium))
}
