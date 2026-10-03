//
//  RootView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct RootView: View {

    @Environment(\.locale)

    private var locale

    @State private var bookStore = BookStore()
    @State private var newsStore = NewsStore()
    @State private var searchText = ""

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    EmoScreen {
                        HomeView(
                            books: bookStore.books
                        )
                    }
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }

            Tab("News", systemImage: "newspaper") {
                NavigationStack {
                    EmoScreen {
                        NewsView(
                            news: newsStore.news
                        )
                    }
                    .navigationTitle("News")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }

            Tab("Settings", systemImage: "gear") {
                NavigationStack {
                    EmoScreen {
                        SettingsView()
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }

            Tab(role: .search) {
                NavigationStack {
                    EmoScreen {
                        SearchView(
                            searchText: searchText,
                            books: bookStore.books,
                            news: newsStore.news
                        )
                    }
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.inline)
                    .searchable(
                        text: $searchText,
                        prompt: "Search"
                    )
                }
            }
        }
        .tint(EmoColors.accent)
        .tabViewSearchActivation(.searchTabSelection)
        .task(id: locale.identifier) {
            loadContent()
        }
    }

    private func loadContent() {
        bookStore.load(locale: locale)
        newsStore.load(locale: locale)
    }
}

#Preview {
    let readingProgress = ReadingProgressStore()

    RootView()
        .environment(readingProgress)
        .preferredColorScheme(.dark)
}
