//
//  Emo_BlackApp.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import SwiftUI

@main
struct Emo_BlackApp: App {

    @State private var readingProgress = ReadingProgressStore()

    @AppStorage("selectedLanguage")
    private var selectedLanguage = "system"

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

    var body: some Scene {
        WindowGroup {
            Group {
                if hasCompletedOnboarding {
                    RootView()
                } else {
                    OnboardingView {
                        hasCompletedOnboarding = true
                    }
                }
            }
            .environment(readingProgress)
            .environment(\.locale, selectedLocale)
            .preferredColorScheme(.dark)
        }
    }
}
