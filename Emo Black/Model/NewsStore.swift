//
//  NewsStore.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import Foundation
import Observation

@Observable
final class NewsStore {

    private(set) var news: [News] = []

    func load(locale: Locale) {
        let languageCode = locale.language.languageCode?.identifier

        let fileName =
            languageCode == "de"
            ? "news_de.json"
            : "news_en.json"

        news = Bundle.main.decode(fileName)
    }
}
