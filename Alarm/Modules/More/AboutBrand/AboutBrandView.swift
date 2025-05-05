//
//  AboutBrandView.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 05.05.2025.
//

import SwiftUI

struct AboutBrandView: View {
    @Environment(\.openURL) private var openURL: OpenURLAction
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    Image(.Logo.explicit)
                    
                    Text("!!! is a direct extension of who i am, just without my name on it. its about translating my ideas, emotions, and aesthetics into something tangible—something that people who connect with it can wear, experience, and be a part of.")
                        .font(.timesNewRoman(size: 16.0))
                        .tracking(.condensedTracking)
                }
                .padding(16.0)
            }
            
            Button("website") {
                if let url = URL(string: Config.standard.websiteURL) {
                    self.openURL(url)
                }
            }
            .buttonStyle(.primary)
            .padding(16.0)
        }
        .navigationTitle("about brand")
    }
}

#Preview {
    AboutBrandView()
}
