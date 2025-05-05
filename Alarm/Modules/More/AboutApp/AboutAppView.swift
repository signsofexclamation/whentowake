//
//  AboutAppView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 05.05.2025.
//

import SwiftUI

struct AboutAppView: View {
    @Environment(\.openURL) private var openURL: OpenURLAction
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                Text("it started as a personal tool — something to help me avoid missing the ideal window to fall asleep. it does not create alarms, does not have fancy features. instead, it helps you find the best time to wake up, based on when you are using it.\n\nhumans sleep in cycles. usually four to six are needed to wake up feeling right. this app does the math and suggests wake times that align with those rhythms — so waking up feels less forced.\n\nmost alarm apps ask for notification permissions up front, sometimes to send spam or ads later. this one does not.\n\nyou can optionally install a shortcut to set system alarms directly. or just use the suggestions and set alarms manually. your choice.\n\nsource code is open. app collects nothing.\ncrafted in the lab. shared because it helped.")
                    .font(.timesNewRoman(size: 16.0))
                    .tracking(.condensedTracking)
                    .padding(16.0)
            }
            
            Button("source code") {
                if let url = URL(string: Config.standard.sourceCodeURL) {
                    self.openURL(url)
                }
            }
            .buttonStyle(.primary)
            .padding(16.0)
        }
        .navigationTitle("about app")
    }
}

#Preview {
    AboutAppView()
}
