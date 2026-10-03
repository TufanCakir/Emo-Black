//
//  EmoBackground.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct EmoBackground: View {

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    EmoColors.midnightLight,
                    EmoColors.midnight,
                    EmoColors.nearBlack,
                    .black,
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            // Purple glow

            Circle()
                .fill(
                    EmoColors.violet.opacity(0.25)
                )
                .frame(
                    width: 360,
                    height: 360
                )
                .blur(radius: 120)
                .offset(
                    x: 160,
                    y: -220
                )

            // Deep violet glow

            Circle()
                .fill(
                    EmoColors.deepViolet.opacity(0.22)
                )
                .frame(
                    width: 420,
                    height: 420
                )
                .blur(radius: 140)
                .offset(
                    x: -180,
                    y: 260
                )

            // Accent glow

            Circle()
                .fill(
                    EmoColors.accent.opacity(0.12)
                )
                .frame(
                    width: 240,
                    height: 240
                )
                .blur(radius: 100)
                .offset(
                    x: 120,
                    y: 100
                )
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}
