//
//  EmoScreen.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct EmoScreen<Content: View>: View {

    @ViewBuilder
    let content: () -> Content

    var body: some View {
        ZStack {
            EmoBackground()

            content()
        }
    }
}
