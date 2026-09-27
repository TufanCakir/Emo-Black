//
//  HomeView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.locale) private var locale

    @State private var searchText = ""

    private var allBooks: [Book] {
        let languageCode = locale.language.languageCode?.identifier
        let fileName =
            languageCode == "de"
            ? "book_de.json"
            : "book_en.json"

        return Bundle.main.decode(fileName)
    }

    private var filteredBooks: [Book] {
        if searchText.isEmpty {
            return allBooks
        } else {
            return allBooks.filter { book in
                book.title.localizedCaseInsensitiveContains(searchText)
                    || book.subTitle.localizedCaseInsensitiveContains(
                        searchText
                    )
            }
        }
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(filteredBooks, id: \.self) { book in
                        VStack {
                            NavigationLink {
                                BookView(book: book)
                            } label: {
                                Image(book.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bücher")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Bücher suchen..."
            )
        }
    }
}

#Preview {
    HomeView()
}
