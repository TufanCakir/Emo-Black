//
//  NewsItemView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct NewsItemView: View {

    let news: News

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            header

            Text(news.message)
                .font(.body)
                .foregroundStyle(.primary)
                .lineSpacing(3)
                .fixedSize(
                    horizontal: false,
                    vertical: true
                )
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }

    // MARK: - Header

    private var header: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {
            Text(news.title)
                .font(.headline)
                .fontWeight(.semibold)

            HStack(spacing: 8) {
                Label {
                    Text("Version \(news.version)")
                } icon: {
                    Image(systemName: "shippingbox")
                }

                Text("•")

                Text(news.date)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}
