//
//  SettingsView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("selectedLanguage")
    private var selectedLanguage = "en"

    @AppStorage("selectedTheme")
    private var selectedTheme = "system"

    var body: some View {
        VStack(spacing: 30) {

            Text("Settings")
                .font(.title)

            Text("Change App Language")
                .font(.headline)

            Picker("Language", selection: $selectedLanguage) {
                Text("English")
                    .tag("en")

                Text("German")
                    .tag("de")
            }
            .pickerStyle(.segmented)

            Text("Appearance")
                .font(.headline)

            Picker("Appearance", selection: $selectedTheme) {
                Text("System")
                    .tag("system")

                Text("Light")
                    .tag("light")

                Text("Dark")
                    .tag("dark")
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
