//
//  Book.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Foundation
import SwiftUI

struct Book: Decodable, Identifiable, Hashable {
    let id: String
    let title: String
    let subTitle: String
    let description: String
    let image: String
    let color: Color

    private enum CodingKeys: String, CodingKey {
        case id, title, subTitle, description, image, color
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        subTitle = try container.decode(String.self, forKey: .subTitle)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)

        switch try container.decode(String.self, forKey: .color) {
        case "white": color = .white
        case "black": color = .black
        default: color = .clear
        }
    }
}
