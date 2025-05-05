//
//  ListItem.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 05.05.2025.
//

import SwiftUI

struct ListItem: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 16.0) {
            Text(self.title)
                .font(.timesNewRoman(size: 16.0))
                .tracking(.spacedTracking)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "chevron.forward")
                .font(.system(size: 14.0))
                .foregroundStyle(.secondary)
        }
        .padding(16.0)
    }
}
