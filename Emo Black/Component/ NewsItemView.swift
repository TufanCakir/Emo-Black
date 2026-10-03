//
//   NewsItemView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct NewsItemView: View {

    let news: News

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(news.title)
                .font(.headline)

            Text("Version \(news.version)")
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(news.message)
                .font(.body)

            Text(news.date)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
