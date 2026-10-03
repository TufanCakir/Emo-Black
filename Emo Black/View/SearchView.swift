//
//  SearchView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct SearchView: View {

    let searchText: String
    let books: [Book]
    let news: [News]

    // MARK: - Search

    private var query: String {
        searchText.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
    }

    private var filteredBooks: [Book] {
        guard !query.isEmpty else {
            return []
        }

        return books.filter { book in
            book.title.localizedCaseInsensitiveContains(query)
                || book.subTitle.localizedCaseInsensitiveContains(query)
                || book.description.localizedCaseInsensitiveContains(query)
        }
    }

    private var filteredNews: [News] {
        guard !query.isEmpty else {
            return []
        }

        return news.filter { item in
            item.title.localizedCaseInsensitiveContains(query)
                || item.message.localizedCaseInsensitiveContains(query)
                || item.version.localizedCaseInsensitiveContains(query)
        }
    }

    private var hasResults: Bool {
        !filteredBooks.isEmpty || !filteredNews.isEmpty
    }

    // MARK: - View

    var body: some View {

        if query.isEmpty {
            emptySearchView
        } else if hasResults {
            searchResults
        } else {
            noResultsView
        }
    }

    // MARK: - Results

    private var searchResults: some View {
        List {
            booksSection
            newsSection
        }
        .scrollContentBackground(.hidden)
    }

    // MARK: - Books

    @ViewBuilder
    private var booksSection: some View {
        if !filteredBooks.isEmpty {
            Section("Books") {
                ForEach(filteredBooks) { book in
                    NavigationLink {
                        BookView(book: book)
                    } label: {
                        HStack(spacing: 12) {
                            Image(book.image)
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: 44,
                                    height: 60
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 6,
                                        style: .continuous
                                    )
                                )

                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {
                                Text(book.title)
                                    .font(.headline)

                                Text(book.subTitle)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
        }
    }

    // MARK: - News

    @ViewBuilder
    private var newsSection: some View {
        if !filteredNews.isEmpty {
            Section("News") {
                ForEach(filteredNews) { item in
                    NewsItemView(news: item)
                        .listRowBackground(Color.clear)
                }
            }
        }
    }

    // MARK: - Empty Search

    private var emptySearchView: some View {
        ContentUnavailableView(
            "Search",
            systemImage: "magnifyingglass",
            description: Text(
                "Search for books and news."
            )
        )
    }

    // MARK: - No Results

    private var noResultsView: some View {
        ContentUnavailableView.search(
            text: query
        )
    }
}

#Preview {
    EmoScreen {
        SearchView(searchText: "", books: [], news: [])
    }
    .preferredColorScheme(.dark)
}
