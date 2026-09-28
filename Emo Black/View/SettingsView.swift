//
//  SettingsView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("selectedLanguage")
    private var selectedLanguage = "system"

    @AppStorage("selectedTheme")
    private var selectedTheme = "system"

    var body: some View {
        Form {

            // MARK: - Language

            Section {
                Picker("Language", selection: $selectedLanguage) {
                    Text("English")
                        .tag("en")

                    Text("German")
                        .tag("de")
                }
            }

            // MARK: - Appearance

            Section {
                Picker("Appearance", selection: $selectedTheme) {
                    Text("System")
                        .tag("system")

                    Text("Light")
                        .tag("light")

                    Text("Dark")
                        .tag("dark")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
