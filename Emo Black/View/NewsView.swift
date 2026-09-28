//
//  NewsView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct NewsView: View {

    var body: some View {
        List {
            Section {
                NewsItemView(
                    version: "1.0",
                    title: "Welcome to Emo Black",
                    message:
                        "The first version of Emo Black is here. Discover stories, explore dark worlds, and enjoy a simple reading experience.",
                    date: "September 2026"
                )
            }
        }
        .listStyle(.insetGrouped)
    }
}

// MARK: - News Item

private struct NewsItemView: View {

    let version: String
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    let date: LocalizedStringKey

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text(title)
                .font(.headline)

            Text("Version \(version)")
                .font(.caption)

            Text(message)
                .font(.body)

            Text(date)
                .font(.caption)
        }
    }
}

#Preview {
    NavigationStack {
        NewsView()
    }
}
