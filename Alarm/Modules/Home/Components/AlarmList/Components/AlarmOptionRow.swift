//
//  AlarmOption.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI

struct AlarmOptionRow: View {
    private let alarmOption: AlarmOption
    
    init(option: AlarmOption) {
        self.alarmOption = option
    }
    
    var body: some View {
        HStack(spacing: 16.0) {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(self.alarmOption.date.time)
                    .font(.timesNewRoman(size: 48.0))
                    .foregroundStyle(.primary)
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(self.alarmOption.sleep.details)
                        .font(.timesNewRoman(size: 14.0))
                        .foregroundStyle(.secondary)
                    
                    Text(self.alarmOption.sleep.description)
                        .font(.timesNewRoman(size: 18.0))
                        .foregroundStyle(.primary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.forward")
                .font(.system(size: 18.0))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AlarmOptionRow(option: .init(date: .now, sleep: .medium))
}
