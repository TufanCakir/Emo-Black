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
            VStack(spacing: 10) {
                Text(book.title)
                    .font(.title)

                Text(book.subTitle)
                    .font(.title2)

                Text(book.description)
                    .font(.system(size: 14))
            }
            .multilineTextAlignment(.center)
        }
    }
}
