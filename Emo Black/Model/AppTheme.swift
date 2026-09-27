//
//  App.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct AppTheme: Decodable, Identifiable, Hashable {
    let id: String
    let title: String
    let color: Color

    private enum CodingKeys: String, CodingKey {
        case id, title, color
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)

        switch try container.decode(String.self, forKey: .color) {
        case "system":
            color = .primary
        case "white":
            color = .white
        case "black":
            color = .black
        default:
            color = .clear
        }
    }
}
