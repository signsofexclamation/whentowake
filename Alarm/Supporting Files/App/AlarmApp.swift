//
//  AlarmApp.swift
//  Alarm
//
//  Created by Tamerlan Satualdypov on 30.04.2025.
//

import SwiftUI
import UIKit

@main
struct AlarmApp: App {
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithTransparentBackground()
        
        navBarAppearance.largeTitleTextAttributes = [
            .font: UIFont(name: "TimesNewRomanPS-BoldMT", size: 36.0) as Any,
        ]
        
        navBarAppearance.titleTextAttributes = [
            .font: UIFont(name: "TimesNewRomanPSMT", size: 16.0) as Any,
            .tracking: CGFloat.spacedTracking
        ]
        
        let backButtonIcon = UIImage(resource: .Icon.back)
        let barButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        let clearAppearance: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.clear]
        
        barButtonAppearance.normal.titleTextAttributes = clearAppearance
        barButtonAppearance.disabled.titleTextAttributes = clearAppearance
        barButtonAppearance.focused.titleTextAttributes = clearAppearance
        barButtonAppearance.highlighted.titleTextAttributes = clearAppearance
        
        navBarAppearance.buttonAppearance = barButtonAppearance
        navBarAppearance.backButtonAppearance = barButtonAppearance
        
        navBarAppearance.setBackIndicatorImage(backButtonIcon, transitionMaskImage: backButtonIcon)
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navBarAppearance
        
        UIBarButtonItem.appearance().tintColor = .accent
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
