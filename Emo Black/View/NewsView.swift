//
//  NewsView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct NewsView: View {

    var body: some View {
        VStack(spacing: 20) {
            Text("News")
                .font(.title)

            Text("Emo Black Version 1.0")
                .font(.headline)
        }
    }
}

#Preview {
    NewsView()
}
