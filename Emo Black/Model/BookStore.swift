//
//  BookStore.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import Foundation
import Observation

@Observable
final class BookStore {

    private(set) var books: [Book] = []

    func load(locale: Locale) {
        let languageCode = locale.language.languageCode?.identifier

        let fileName =
            languageCode == "de"
            ? "book_de.json"
            : "book_en.json"

        books = Bundle.main.decode(fileName)
    }
}
