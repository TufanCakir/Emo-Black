//
//  NewsView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import SwiftUI

struct NewsView: View {

    let news: [News]

    var body: some View {
        ScrollView {
            ForEach(news) { item in
                GlassCard(
                    title: "News",
                ) {
                    NewsItemView(news: item)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {

    let news: [News] = Bundle.main.decode("news_de.json")

    NavigationStack {
        EmoScreen {
            NewsView(news: news)
        }
        .preferredColorScheme(.dark)
    }
}
