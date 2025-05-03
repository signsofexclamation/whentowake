//
//  ShortcutPrompt.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 03.05.2025.
//

import SwiftUI

struct ShortcutPrompt: View {
    @State private var isExplanationSheetPresented: Bool = false
    @Binding private var isPresented: Bool
    
    @Environment(\.openURL) private var openURL: OpenURLAction
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 32.0) {
                    Image(.Logo.default)
                        .resizable()
                        .frame(width: 128.0, height: 400.0)
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("set alarms through app.")
                            .font(.timesNewRoman(size: 24.0))
                        
                        Text("adding the shortcut enables direct alarm creation from suggested times. takes a few seconds to install.")
                            .font(.timesNewRoman(size: 18.0))
                    }
                    .tracking(.condensedTracking)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                VStack(spacing: 16.0) {
                    Button("add shortcut") {
                        if let url = URL(string: Config.standard.shortcutURL) {
                            openURL(url) { accepted in
                                Settings.isShortcutSet = accepted
                            }
                        }
                    }
                    .buttonStyle(.primary)
                    
                    Button("why?") {
                        self.isExplanationSheetPresented = true
                    }
                    .buttonStyle(.secondary)
                }
            }
            .padding(.vertical, 32.0)
            .padding(.horizontal, 16.0)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("[x]") {
                        self.isPresented = false
                    }
                    .font(.timesNewRoman(size: 18.0))
                    .foregroundStyle(.primary)
                }
            }
        }
        .sheet(isPresented: self.$isExplanationSheetPresented) {
            ShortcutExplanationSheet(isPresented: self.$isExplanationSheetPresented)
                .presentationDetents([.height(400.0)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    ShortcutPrompt(isPresented: .constant(true))
}
