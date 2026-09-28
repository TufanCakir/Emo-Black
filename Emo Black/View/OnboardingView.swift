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
        viewModel.isLastPage ? "Open Book" : "Continue"
    }

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Skip

            HStack {
                Spacer()

                if !viewModel.isLastPage {
                    Button("Skip") {
                        onCompletion()
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.secondary)
                }
            }
            .frame(height: 44)
            .padding(.horizontal)

            // MARK: - Pages

            TabView(selection: $viewModel.selectedPage) {
                ForEach(viewModel.pages) { page in
                    OnboardingPageView(page: page)
                        .tag(page.id)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))

            // MARK: - Continue

            Button {
                withAnimation(.snappy) {
                    viewModel.continueAction(
                        onCompletion: onCompletion
                    )
                }
            } label: {
                Text(primaryButtonTitle)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

// MARK: - Page

private struct OnboardingPageView: View {

    let page: OnboardingPage

    var body: some View {
        VStack(spacing: 28) {
            Spacer()

            artwork

            VStack(spacing: 12) {
                Text(page.title)
                    .font(.largeTitle.bold())

                Text(page.message)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: 360)

            Spacer()
        }
        .padding(.horizontal, 24)
    }

    @ViewBuilder
    private var artwork: some View {
        switch page.artwork {
        case .asset(let name):
            Image(name)
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)

        case .symbol(let name):
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.tint)
                .accessibilityHidden(true)
        }
    }
}
