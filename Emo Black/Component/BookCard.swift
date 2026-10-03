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

    private var progress: Double {
        readingProgress.progress(for: book.id)
    }

    var body: some View {
        NavigationLink {
            BookView(book: book)
        } label: {
            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                cover

                bookInformation

                ReadingProgressView(
                    progress: progress
                )
            }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .combine)
    }

    // MARK: - Cover

    private var cover: some View {
        Image(book.image)
            .resizable()
            .scaledToFill()
            .aspectRatio(
                2 / 3,
                contentMode: .fill
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                )
            )
    }

    // MARK: - Information

    private var bookInformation: some View {
        VStack(
            alignment: .leading,
            spacing: 3
        ) {
            Text(book.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
                .lineLimit(
                    2,
                    reservesSpace: true
                )

            Text(book.subTitle)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .lineLimit(
                    2,
                    reservesSpace: true
                )
        }
    }
}

#Preview {
    let books: [Book] = Bundle.main.decode(
        "book_de.json"
    )

    let readingProgress = ReadingProgressStore()

    NavigationStack {
        EmoScreen {
            BookCard(book: books[0])
                .frame(width: 120)
                .padding()
        }
    }
    .environment(readingProgress)
    .preferredColorScheme(.dark)
}
