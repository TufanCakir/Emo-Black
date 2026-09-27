//
//  Emo_BlackApp.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import SwiftUI

@main
struct Emo_BlackApp: App {

    @AppStorage("selectedLanguage") private var selectedLanguage: String = "en"

    @AppStorage("hasCompletedOnboarding")

    private var hasCompletedOnboarding = false

    @AppStorage("selectedTheme")

    private var selectedTheme = "system"

    private var colorScheme: ColorScheme? {
        switch selectedTheme {
        case "light":
            return .light

        case "dark":
            return .dark

        default:
            return nil
        }
    }

    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                RootView()
                    .transition(.opacity)
            } else {
                OnboardingView {
                    hasCompletedOnboarding = true
                }
                .transition(.opacity)
                .preferredColorScheme(colorScheme)
            }
        }
        .environment(
            \.locale,
            Locale(identifier: selectedLanguage)
        )
    }
}
