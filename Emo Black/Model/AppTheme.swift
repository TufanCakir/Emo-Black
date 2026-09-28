//
//  AppTheme.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct AppTheme: Codable, Identifiable, Hashable {

    let id: String
    let title: String
    let appearance: AppAppearance
}

// MARK: - Appearance

enum AppAppearance: String, Codable, Hashable {
    case system
    case light
    case dark

    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            nil

        case .light:
            .light

        case .dark:
            .dark
        }
    }

    var systemImage: String {
        switch self {
        case .system:
            "circle.lefthalf.filled"

        case .light:
            "sun.max"

        case .dark:
            "moon"
        }
    }
}
