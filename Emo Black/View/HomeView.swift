//
//  HomeView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import SwiftUI

struct HomeView: View {

    let books: [Book]

    private let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: 24
            ) {
                ForEach(books) { book in
                    BookCard(book: book)
                }
            }
            .padding()
        }
    }
}

#Preview {

    let books: [Book] = Bundle.main.decode("book_de.json")
    let readingProgress = ReadingProgressStore()

    NavigationStack {
        HomeView(books: books)
    }
    .environment(readingProgress)
}
