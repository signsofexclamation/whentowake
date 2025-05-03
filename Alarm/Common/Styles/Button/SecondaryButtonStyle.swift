//
//  SecondaryButtonStyle.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 03.05.2025.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.timesNewRoman(size: 14.0))
            .tracking(.spacedTracking)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .opacity(configuration.isPressed ? 0.2 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: Self {
        return .init()
    }
}
