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
            message:
                "Welcome to a world of dark, mysterious and unforgettable stories.",
            artwork: .asset("emo_black_logo")
        ),

        OnboardingPage(
            id: "stories",
            title: "Discover Stories",
            message:
                "Explore different stories filled with mystery, fantasy, battles and unexpected encounters.",
            artwork: .symbol("books.vertical.fill")
        ),

        OnboardingPage(
            id: "worlds",
            title: "Different Worlds",
            message:
                "Every story takes you somewhere new — from dark city streets to ancient kingdoms and forgotten worlds.",
            artwork: .symbol("globe.europe.africa.fill")
        ),

        OnboardingPage(
            id: "characters",
            title: "Meet New Characters",
            message:
                "Follow mysterious characters, powerful warriors and unexpected heroes on their journeys.",
            artwork: .symbol("person.2.fill")
        ),

        OnboardingPage(
            id: "language",
            title: "Your Language",
            message:
                "Read stories in your preferred language. Emo Black automatically adapts to your language settings.",
            artwork: .symbol("character.book.closed.fill")
        ),

        OnboardingPage(
            id: "start",
            title: "Start Reading",
            message:
                "Choose your first story and enter the world of Emo Black.",
            artwork: .symbol("book.pages.fill")
        ),
    ]
}
