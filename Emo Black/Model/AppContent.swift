//
//  AppContent.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Foundation

struct AppContent: Codable, Identifiable, Hashable {

    let id: String

    private let titleKey: String
    private let subTitleKey: String
    private let descriptionKey: String

    var title: String {
        localized(titleKey)
    }

    var subTitle: String {
        localized(subTitleKey)
    }

    var description: String {
        localized(descriptionKey)
    }

    private func localized(_ key: String) -> String {
        String(
            localized: String.LocalizationValue(key)
        )
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case titleKey = "title_key"
        case subTitleKey = "subtitle_key"
        case descriptionKey = "description_key"
    }
}
