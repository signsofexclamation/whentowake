//
//  DefaultButtonStyle.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 03.05.2025.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.timesNewRoman(size: 14.0))
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .frame(height: 44.0)
            .border(.primary)
            .contentShape(Rectangle())
            .opacity(configuration.isPressed ? 0.2 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: Self {
        return .init()
    }
}
