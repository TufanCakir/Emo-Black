//
//  HomeView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import SwiftUI

struct HomeView: View {

    @Environment(\.locale)
    private var locale

    @State private var searchText = ""

    private var books: [Book] {
        let languageCode = locale.language.languageCode?.identifier

        let fileName =
            languageCode == "de"
            ? "book_de.json"
            : "book_en.json"

        return Bundle.main.decode(fileName)
    }

    private var filteredBooks: [Book] {
        guard !searchText.isEmpty else {
            return books
        }

        return books.filter { book in
            book.title.localizedCaseInsensitiveContains(searchText)
                || book.subTitle.localizedCaseInsensitiveContains(searchText)
        }
    }

    private let columns = [
        GridItem(
            .adaptive(minimum: 110, maximum: 160),
            spacing: 20
        )
    ]

    var body: some View {
        Group {
            if filteredBooks.isEmpty {
                ContentUnavailableView.search(text: searchText)
            } else {
                ScrollView {
                    LazyVGrid(
                        columns: columns,
                        spacing: 24
                    ) {
                        ForEach(filteredBooks, id: \.id) { book in
                            BookCard(book: book)
                        }
                    }
                    .padding()
                }
            }
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search Books"
        )
    }
}

// MARK: - Book Card

private struct BookCard: View {

    let book: Book
    
    var body: some View {
        NavigationLink {
            BookView(book: book)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(book.image)
                    .resizable()
                    .scaledToFit()

                Text(book.title)
                    .font(.caption)

                Text(book.subTitle)
                    .font(.caption)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
