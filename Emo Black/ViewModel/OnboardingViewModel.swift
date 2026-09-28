//
//  OnboardingViewModel.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Observation

@MainActor
@Observable
final class OnboardingViewModel {

    // MARK: - Properties

    let pages = OnboardingPage.pages

    var selectedPage: String

    // MARK: - Init

    init() {
        selectedPage = OnboardingPage.pages.first?.id ?? ""
    }

    // MARK: - State

    var isLastPage: Bool {
        selectedPage == pages.last?.id
    }

    // MARK: - Actions

    func continueAction(onCompletion: () -> Void) {
        guard !isLastPage else {
            onCompletion()
            return
        }

        guard
            let currentIndex = pages.firstIndex(
                where: { $0.id == selectedPage }
            )
        else {
            return
        }

        let nextIndex = pages.index(after: currentIndex)

        guard pages.indices.contains(nextIndex) else {
            return
        }

        selectedPage = pages[nextIndex].id
    }
}
