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
                    Color(
                        red: 0.20,
                        green: 0.03,
                        blue: 0.28
                    ),
                    Color(
                        red: 0.08,
                        green: 0.02,
                        blue: 0.14
                    ),
                    .black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(.purple.opacity(0.32))
                .frame(width: 300, height: 300)
                .blur(radius: 100)
                .offset(x: 150, y: -200)

            Circle()
                .fill(.pink.opacity(0.18))
                .frame(width: 350, height: 350)
                .blur(radius: 120)
                .offset(x: -180, y: 250)
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}
