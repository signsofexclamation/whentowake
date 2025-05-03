//
//  ShortcutExplanationSheet.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 03.05.2025.
//

import SwiftUI

struct ShortcutExplanationSheet: View {
    @Binding private var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("why shortcut")
                    .font(.timesNewRoman(size: 24.0))
                
                Text("this app focuses on guiding when to wake up — not on sending notifications or pretending to be an alarm.\n\nto create alarms natively in the Clock app, a shortcut is used. add it once to enable direct, real alarm creation from suggested times. the shortcut is safe, runs locally, and can be removed at any time.")
                    .font(.timesNewRoman(size: 18.0))
            }
            .tracking(.condensedTracking)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            Button("got it") {
                self.isPresented = false
            }
            .buttonStyle(.primary)
        }
        .padding(.top, 32.0)
        .padding([.horizontal, .bottom], 16.0)
    }
}

#Preview {
    ShortcutExplanationSheet(isPresented: .constant(true))
}
