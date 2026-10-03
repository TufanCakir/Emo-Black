//
//  GlassCard.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct GlassCard<Content: View>: View {

    let title: LocalizedStringKey

    @ViewBuilder
    let content: () -> Content

    private let cornerRadius: CGFloat = 24

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)

            content()
        }
        .padding(20)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background {
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
            .fill(.ultraThinMaterial)
        }
        .overlay {
            RoundedRectangle(
                cornerRadius: cornerRadius,
                style: .continuous
            )
            .stroke(
                .white.opacity(0.12),
                lineWidth: 1
            )
        }
        .contentShape(
            .rect(
                cornerRadius: cornerRadius
            )
        )
    }
}
