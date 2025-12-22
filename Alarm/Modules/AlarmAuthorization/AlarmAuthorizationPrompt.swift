//
//  AlarmAuthorizationPrompt.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 03.05.2025.
//

import SwiftUI

struct AlarmAuthorizationPrompt: View {
    @Binding private var isPresented: Bool
    
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
                        
                        Text("the app uses alarms only to wake you up at the time you set, ensuring you do not miss your planned wake-up.")
                            .font(.timesNewRoman(size: 18.0))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                VStack(spacing: 16.0) {
                    Button("allow alarms") {
                        print("system permission prompt")
                    }
                    .buttonStyle(.primary)
                }
            }
            .padding(.vertical, 32.0)
            .padding(.horizontal, 16.0)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "xmark") {
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
    AlarmAuthorizationPrompt(isPresented: .constant(true))
}
