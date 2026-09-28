//
//  BookView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct BookView: View {
    let book: Book

    var body: some View {
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
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 650, alignment: .leading)
                    .textSelection(.enabled)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    let books: [Book] = Bundle.main.decode("book_de.json")

    BookView(book: books[0])
}
