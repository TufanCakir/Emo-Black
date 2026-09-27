//
//  AppContent.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Foundation

struct AppContent: Codable, Identifiable {
    let id: Int
    private let title_key: String
    private let subTitle_key: String
    private let description_key: String

    var title: String {
        String(localized: String.LocalizationValue(title_key))
    }

    var subTitle: String {
        String(localized: String.LocalizationValue(subTitle_key))
    }

    var description: String {
        String(localized: String.LocalizationValue(description_key))
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title_key = "title_key"
        case subTitle_key = "subTitle_key"
        case description_key = "description_key"
    }
}
