//
//  OnboardingViewModel.swift
//  Emo Black
//
//  Created by Tufan Cakir on 22.09.26.
//

import Observation

@MainActor
@Observable
final class OnboardingViewModel {

    // MARK: - Properties

    let pages = OnboardingPage.pages

    var selectedIndex = 0

    // MARK: - State

    var isLastPage: Bool {
        selectedIndex == pages.indices.last
    }

    // MARK: - Actions

    func continueAction(onCompletion: () -> Void) {
        guard !isLastPage else {
            onCompletion()
            return
        }

        selectedIndex += 1
    }
}
