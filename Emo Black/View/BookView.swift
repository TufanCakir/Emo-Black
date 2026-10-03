//
//  BookView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct BookView: View {

    @Environment(ReadingProgressStore.self)

    private var readingProgress

    let book: Book

    var body: some View {
        EmoScreen {
            ScrollView {
                VStack(spacing: 32) {

                    VStack(spacing: 8) {
                        Text(book.title)
                            .font(.largeTitle)
                            .fontWeight(.semibold)

                        Text(book.subTitle)
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)

                    Text(book.description)
                        .font(.body)
                        .lineSpacing(7)
                        .frame(
                            maxWidth: 650,
                            alignment: .leading
                        )
                        .textSelection(.enabled)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 32)
                .frame(maxWidth: .infinity)
            }
            .scrollIndicators(.hidden)
            .onScrollGeometryChange(
                for: Double.self
            ) { geometry in

                let scrollableHeight =
                    geometry.contentSize.height
                    - geometry.containerSize.height

                guard scrollableHeight > 0 else {
                    return 1
                }

                return min(
                    max(
                        geometry.contentOffset.y / scrollableHeight,
                        0
                    ),
                    1
                )

            } action: { _, progress in
                readingProgress.setProgress(
                    progress,
                    for: book.id
                )
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    let books: [Book] = Bundle.main.decode("book_de.json")
    let readingProgress = ReadingProgressStore()

    BookView(book: books[0])
        .environment(readingProgress)
        .preferredColorScheme(.dark)
}
