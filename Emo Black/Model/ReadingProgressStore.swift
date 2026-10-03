//
//  ReadingProgressStore.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import Foundation
import Observation

@Observable
final class ReadingProgressStore {

    private var progress: [String: Double] = [:]

    init() {
        load()
    }

    func progress(for bookID: String) -> Double {
        progress[bookID] ?? 0
    }

    func setProgress(_ value: Double, for bookID: String) {
        let value = min(max(value, 0), 1)
        let currentProgress = progress[bookID] ?? 0

        guard value > currentProgress else {
            return
        }

        progress[bookID] = value
        save()
    }

    private func save() {
        UserDefaults.standard.set(
            progress,
            forKey: "readingProgress"
        )
    }

    private func load() {
        progress =
            UserDefaults.standard.dictionary(
                forKey: "readingProgress"
            ) as? [String: Double] ?? [:]
    }
}
