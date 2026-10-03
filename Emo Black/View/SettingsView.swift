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

    private var appVersion: String {
        Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        ) as? String ?? "–"
    }

    private var buildNumber: String {
        Bundle.main.object(
            forInfoDictionaryKey: "CFBundleVersion"
        ) as? String ?? "–"
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GlassCard(
                    title: "Language"
                ) {
                    Picker(
                        "Language",
                        selection: $selectedLanguage
                    ) {
                        Text("System")
                            .tag("system")

                        Text("English")
                            .tag("en")

                        Text("German")
                            .tag("de")
                    }
                    .pickerStyle(.menu)
                }

                GlassCard(
                    title: "About"
                ) {
                    VStack(spacing: 16) {
                        LabeledContent("Version") {
                            Text(appVersion)
                                .foregroundStyle(.secondary)
                        }

                        Divider()

                        LabeledContent("Build") {
                            Text(buildNumber)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
