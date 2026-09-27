//
//  OnboardingModels.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Foundation

enum OnboardingArtwork: Equatable {
    case asset(String)
    case symbol(String)
}

struct OnboardingPage: Identifiable, Equatable {
    let id: Int
    let title: String
    let message: String
    let artwork: OnboardingArtwork

    static let pages: [OnboardingPage] = [
        OnboardingPage(
            id: 0,
            title: "Emo Black",
            message: "Willkommen bei Emo Black.",
            artwork: .asset("e_logo")
        ),
        OnboardingPage(
            id: 1,
            title: "Geschichten",
            message:
                "Endecke spannende Geschichten",
            artwork: .symbol("book.fill")
        ),
    ]
}
