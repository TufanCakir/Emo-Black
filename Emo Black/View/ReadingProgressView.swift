//
//  ReadingProgressView.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

struct ReadingProgressView: View {

    let progress: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ProgressView(value: progress)

            Text(progress, format: .percent.precision(.fractionLength(0)))
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ReadingProgressView(progress: 0.82)
        .padding()
}
