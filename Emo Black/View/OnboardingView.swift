//
//  OnboardingView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct OnboardingView: View {

    @State private var viewModel = OnboardingViewModel()

    let onCompletion: () -> Void

    private var primaryButtonTitle: LocalizedStringResource {
        viewModel.isLastPage
            ? "Open Book"
            : "Continue"
    }

    var body: some View {
        EmoScreen {
            VStack(spacing: 0) {
                header

                pages

                footer
            }
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            Spacer()

            if !viewModel.isLastPage {
                Button("Skip") {
                    onCompletion()
                }
                .foregroundStyle(.secondary)
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Pages

    private var pages: some View {
        TabView(
            selection: $viewModel.selectedIndex
        ) {
            ForEach(
                Array(viewModel.pages.enumerated()),
                id: \.element.id
            ) { index, page in
                OnboardingPageView(page: page)
                    .tag(index)
            }
        }
        .tabViewStyle(
            .page(indexDisplayMode: .always)
        )
    }

    // MARK: - Footer

    private var footer: some View {
        Button {
            continueAction()
        } label: {
            Text(primaryButtonTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding(.horizontal)
        .tint(EmoColors.accent)
    }

    // MARK: - Actions

    private func continueAction() {
        withAnimation(.snappy) {
            viewModel.continueAction(
                onCompletion: onCompletion
            )
        }
    }
}

// MARK: - Page

private struct OnboardingPageView: View {

    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            artwork

            VStack(spacing: 12) {
                Text(page.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(page.message)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .multilineTextAlignment(.center)

            Spacer()
        }
    }

    // MARK: - Artwork

    @ViewBuilder
    private var artwork: some View {
        switch page.artwork {
        case .asset(let name):
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(
                    maxWidth: 180,
                    maxHeight: 180
                )
                .accessibilityHidden(true)

        case .symbol(let name):
            symbolArtwork(name)
        }
    }

    private func symbolArtwork(
        _ name: String
    ) -> some View {
        VStack {
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.tint)
                .frame(
                    width: 72,
                    height: 72
                )
                .tint(EmoColors.accent)

        }
        .accessibilityHidden(true)
    }
}

#Preview {
    OnboardingView(onCompletion: {})
        .preferredColorScheme(.dark)
}
