//
//  AboutAppView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 05.05.2025.
//

import SwiftUI

struct AboutView: View {
    @Binding private var isPresented: Bool
    
    @Environment(\.openURL) private var openURL: OpenURLAction
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16.0) {
                        Text("it started as a personal tool — something that helped avoid missing the ideal window to fall asleep. it does not create alarms and does not have fancy features. instead, it helps you find the best time to wake up, based on when you are using it.\n\nhumans sleep in cycles. usually four to six are needed to wake up feeling right. this app does the math and suggests wake times that align with those rhythms — so waking up feels less forced.\n\nsource code is open. app collects nothing.")
                            .font(.timesNewRoman(size: 16.0))
                        
                        VStack(alignment: .leading, spacing: 8.0) {
                            Button {
                                if let url = URL(string: Config.standard.sourceCodeURL) {
                                    self.openURL(url)
                                }
                            } label: {
                                Text("source code")
                                    .font(.timesNewRoman(size: 16.0))
                                    .underline()
                                    .foregroundStyle(.link)
                            }
                            .buttonStyle(.plain)
                            
                            Button {
                                if let url = URL(string: Config.standard.websiteURL) {
                                    self.openURL(url)
                                }
                            } label: {
                                Text("brand website")
                                    .font(.timesNewRoman(size: 16.0))
                                    .underline()
                                    .foregroundStyle(.link)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical, 4.0)
                    .padding(.horizontal, 16.0)
                }
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("version \(Config.standard.appVersion)")
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("signsofexclamation.")
                        Text("year \(Date.now.year).")
                    }
                }
                .font(.timesNewRoman(size: 14.0))
                .foregroundStyle(.secondary)
                .padding([.horizontal, .bottom], 16.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("about")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("", systemImage: "xmark") {
                        self.isPresented = false
                    }
                    .foregroundStyle(.primary)
                }
            }
        }
    }
}

#Preview {
    AboutView(isPresented: .constant(true))
}
