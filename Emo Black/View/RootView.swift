//
//  RootView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

private enum RootTab: CaseIterable {
    case home, news, settings

    var title: String {
        switch self {
        case .home: "Home"
        case .news: "News"
        case .settings: "Settings"
        }
    }

    @ViewBuilder
    var content: some View {
        switch self {
        case .home: HomeView()
        case .news: NewsView()
        case .settings: SettingsView()
        }
    }
}

struct RootView: View {
    var body: some View {
        TabView {
            ForEach(RootTab.allCases, id: \.self) { tab in
                Tab(tab.title, systemImage: tab.title) {
                    tab.content
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
