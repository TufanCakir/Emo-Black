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

    let id: String
    let title: LocalizedStringResource
    let message: LocalizedStringResource
    let artwork: OnboardingArtwork

    static let pages: [OnboardingPage] = [
        OnboardingPage(
            id: "welcome",
            title: "Emo Black",
            message: "Welcome to Emo Black.",
            artwork: .asset("e_logo")
        ),

        OnboardingPage(
            id: "stories",
            title: "Stories",
            message: "Discover exciting stories.",
            artwork: .symbol("book.fill")
        ),
    ]
}
