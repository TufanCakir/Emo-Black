//
//  JsonLoader.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        // 1. Pfad zur Datei finden
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Die Datei \(file) wurde nicht im Bundle gefunden.")
        }

        // 2. Daten laden
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fehler beim Laden von \(file) aus dem Bundle.")
        }

        // 3. Daten decodieren
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError(
                "Fehler beim Parsen von \(file): \(error.localizedDescription)"
            )
        }
    }
}
