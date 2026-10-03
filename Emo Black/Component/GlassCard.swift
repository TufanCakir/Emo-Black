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

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

       

            content()
        }
        .padding(20)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(.ultraThinMaterial)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24,
                style: .continuous
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: 24,
                style: .continuous
            )
            .stroke(
                .white.opacity(0.15),
                lineWidth: 1
            )
        }
    }
}
