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

    // MARK: - App Information

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

    // MARK: - View

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                languageCard
                aboutCard
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Language

    private var languageCard: some View {
        GlassCard(title: "Language") {
            LabeledContent {
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
                .labelsHidden()
                .pickerStyle(.menu)
            } label: {
                Label(
                    "Language",
                    systemImage: "character.bubble"
                )
            }
        }
    }

    // MARK: - About

    private var aboutCard: some View {
        GlassCard(title: "About") {
            VStack(spacing: 16) {
                LabeledContent {
                    Text(appVersion)
                        .foregroundStyle(.secondary)
                } label: {
                    Label(
                        "Version",
                        systemImage: "info.circle"
                    )
                }

                Divider()

                LabeledContent {
                    Text(buildNumber)
                        .foregroundStyle(.secondary)
                } label: {
                    Label(
                        "Build",
                        systemImage: "hammer"
                    )
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EmoScreen {
            SettingsView()
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    .preferredColorScheme(.dark)
}
