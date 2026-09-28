//
//  Book.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct Book: Codable, Identifiable, Hashable {

    let id: String
    let title: String
    let subTitle: String
    let description: String
    let image: String
    let color: BookColor
}

// MARK: - Book Color

enum BookColor: String, Codable, Hashable {
    case white
    case black

    var color: Color {
        switch self {
        case .white:
            .white

        case .black:
            .black
        }
    }
}
