//
//  MoreView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 05.05.2025.
//

import SwiftUI

struct MoreView: View {
    @Binding private var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 8.0) {
                        NavigationLink {
                            AboutAppView()
                        } label: {
                            ListItem(title: "about app")
                        }
                        .foregroundStyle(.primary)
                        
                        NavigationLink {
                            AboutBrandView()
                        } label: {
                            ListItem(title: "about brand")
                        }
                        .foregroundStyle(.primary)
                    }
                    .padding(.top, 16.0)
                }
                
                VStack(alignment: .leading) {
                    Text("version \(Config.standard.appVersion)")
                    Text("three signs of exclamation.")
                }
                .font(.timesNewRoman(size: 14.0))
                .tracking(.spacedTracking)
                .foregroundStyle(.secondary)
                .padding([.horizontal, .bottom], 16.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(.Logo.default)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("[x]") {
                        self.isPresented = false
                    }
                    .font(.timesNewRoman(size: 18.0))
                    .foregroundStyle(.primary)
                }
            }
        }
    }
}

#Preview {
    MoreView(isPresented: .constant(true))
}
