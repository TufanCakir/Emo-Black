//
//  BookCard.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct BookCard: View {

    @Environment(ReadingProgressStore.self)
    private var readingProgress

    let book: Book

    var body: some View {
        NavigationLink {
            BookView(book: book)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(book.image)
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(2 / 3, contentMode: .fill)
                    .clipped()

                Text(book.title)
                    .font(.caption)
                    .lineLimit(2, reservesSpace: true)

                Text(book.subTitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2, reservesSpace: true)

                ReadingProgressView(
                    progress: readingProgress.progress(for: book.id)
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    let books: [Book] = Bundle.main.decode("book_de.json")
    let readingProgress = ReadingProgressStore()

    NavigationStack {
        BookCard(book: books[0])
            .frame(width: 120)
            .padding()
    }
    .environment(readingProgress)
}
