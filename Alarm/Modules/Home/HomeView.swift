//
//  HomeView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var alarms: [Alarm] = []
    
    var body: some View {
        NavigationStack {
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
                            Image(.logoSmall)
                            Text("alarm")
                                .font(.timesNewRoman(size: 12.0))
                                .tracking(4.0)
                        }
                        .padding(.top, 16.0)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("about") {
                            
                        }
                        .foregroundStyle(.black)
                        .font(.timesNewRoman(size: 12.0))
                        .tracking(4.0)
                        .padding(.top, 16.0)
                    }
                }
            }
        }
        .onAppear {
            self.alarms = Alarm.options(for: .now)
        }
    }
}

#Preview {
    HomeView()
}
