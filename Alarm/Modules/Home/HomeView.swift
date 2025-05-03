//
//  HomeView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var isShortcutPromptPresented: Bool = false
    
    var body: some View {
        NavigationView {
            TimelineView(.everyMinute) { context in
                VStack(spacing: 32.0) {
                    BigClock(for: context.date)
                    AlarmList(for: context.date)
                        .padding(.horizontal, 16.0)
                }
                .padding(.bottom, 24.0)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Image(.Logo.default)
                            Text("alarm")
                                .font(.timesNewRoman(size: 12.0))
                                .tracking(.spacedTracking)
                        }
                        .padding(.top, 16.0)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("about") {
                            
                        }
                        .foregroundStyle(.primary)
                        .font(.timesNewRoman(size: 12.0))
                        .tracking(.spacedTracking)
                        .padding(.top, 16.0)
                    }
                }
            }
        }
        .onAppear {
            if !Settings.isShortcutSet {
                self.isShortcutPromptPresented = true
            }
        }
        .fullScreenCover(isPresented: self.$isShortcutPromptPresented) {
            ShortcutPrompt(isPresented: self.$isShortcutPromptPresented)
        }
    }
}

#Preview {
    HomeView()
}
