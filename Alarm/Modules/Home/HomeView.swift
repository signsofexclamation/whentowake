//
//  HomeView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 01.05.2025.
//

import SwiftUI
import AlarmKit

struct HomeView: View {
    @State private var isAboutViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            TimelineView(.everyMinute) { context in
                VStack(spacing: 32.0) {
                    BigClock(for: context.date)
                        .foregroundStyle(.primary)
                    
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
                            self.isAboutViewPresented = true
                        }
                        .foregroundStyle(.primary)
                    }
                }
            }
        }
        .sheet(isPresented: self.$isAboutViewPresented) {
            AboutView(isPresented: self.$isAboutViewPresented)
        }
    }
}

#Preview {
    HomeView()
}
