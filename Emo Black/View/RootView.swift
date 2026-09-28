//
//  RootView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

private enum RootTab: String, CaseIterable, Identifiable {
    case home
    case news
    case settings

    var id: Self { self }

    var title: LocalizedStringKey {
        switch self {
        case .home:
            "Home"

        case .news:
            "News"

        case .settings:
            "Settings"
        }
    }

    var systemImage: String {
        switch self {
        case .home:
            "house"

        case .news:
            "newspaper"

        case .settings:
            "gearshape"
        }
    }

    @ViewBuilder
    var content: some View {
        switch self {
        case .home:
            HomeView()
            
        case .news:
            NewsView()

        case .settings:
            SettingsView()
        }
    }
}

struct RootView: View {

    @State private var selectedTab: RootTab = .home
    @State private var isReadingBook = false

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(RootTab.allCases) { tab in
                NavigationStack {
                    tab.content
                        .navigationTitle(tab.title)
                        .navigationBarTitleDisplayMode(.inline)
                }
                .tag(tab)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(
            .page(backgroundDisplayMode: isReadingBook ? .never : .always)
        )
    }
}

#Preview {
    RootView()
}
