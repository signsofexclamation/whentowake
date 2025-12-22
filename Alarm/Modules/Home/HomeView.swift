//
//  HomeView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI
import AlarmKit

struct HomeView: View {
    @State private var isAlarmAuthorizationPromptPresented: Bool = false
    @State private var isMoreViewPresented: Bool = false
    @State private var alarms: [Alarm] = Alarm.all
    
    var body: some View {
        NavigationView {
            TimelineView(.everyMinute) { context in
                VStack(spacing: 32.0) {
                    BigClock(for: context.date)
                        .foregroundStyle(alarms.isEmpty ? .primary : .secondary)
                    
                    AlarmList(for: context.date)
                        .padding(.horizontal, 16.0)
                }
                .padding(.bottom, 24.0)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image(.Logo.default)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("", systemImage: "ellipsis") {
                            self.isMoreViewPresented = true
                        }
                        .foregroundStyle(.primary)
                        .font(.timesNewRoman(size: 14.0))
                        .tracking(.spacedTracking)
                    }
                }
            }
        }
        .onAppear {
            if !Settings.isAlarmAuthorized {
//                self.isAlarmAuthorizationPromptPresented = true
            }
        }
        .fullScreenCover(isPresented: self.$isAlarmAuthorizationPromptPresented) {
            AlarmAuthorizationPrompt(isPresented: self.$isAlarmAuthorizationPromptPresented)
        }
        .sheet(isPresented: self.$isMoreViewPresented) {
            MoreView(isPresented: self.$isMoreViewPresented)
        }
    }
}

#Preview {
    HomeView()
}
