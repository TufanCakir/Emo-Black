//
//  Emo_BlackApp.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import SwiftUI

@main
struct Emo_BlackApp: App {

    @AppStorage("selectedLanguage")
    private var selectedLanguage = "system"

    @AppStorage("selectedTheme")
    private var selectedTheme = "system"

    @AppStorage("hasCompletedOnboarding")
    private var hasCompletedOnboarding = false

    private var selectedLocale: Locale {
        switch selectedLanguage {
        case "de":
            Locale(identifier: "de")
        case "en":
            Locale(identifier: "en")
        default:
            .autoupdatingCurrent
        }
    }

    private var preferredColorScheme: ColorScheme? {
        switch selectedTheme {
        case "light":
            .light
        case "dark":
            .dark
        default:
            nil
        }
    }

    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                RootView()
                    .preferredColorScheme(preferredColorScheme)
                    .environment(\.locale, selectedLocale)
            } else {
                OnboardingView {
                    hasCompletedOnboarding = true
                }
                .preferredColorScheme(preferredColorScheme)
                .environment(\.locale, selectedLocale)
            }
        }
    }
}
