//
//  JsonLoader.swift
//  Emo Black
//
//  Created by Tufan Cakir on 27.09.26.
//

import Foundation

extension Bundle {

    func decode<T: Decodable>(
        _ file: String,
        as type: T.Type = T.self
    ) -> T {

        guard
            let url = url(
                forResource: file,
                withExtension: nil
            )
        else {
            fatalError(
                "❌ \(file) wurde nicht im Bundle gefunden."
            )
        }

        let data: Data

        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError(
                """
                ❌ \(file) konnte nicht geladen werden.
                \(error.localizedDescription)
                """
            )
        }

        let decoder = JSONDecoder()

        do {
            return try decoder.decode(type, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            fatalError(
                """
                ❌ Fehlender JSON-Key: \(key.stringValue)
                Datei: \(file)
                Pfad: \(context.codingPath.path)
                """
            )
        } catch let DecodingError.typeMismatch(type, context) {
            fatalError(
                """
                ❌ Falscher Datentyp für \(type)
                Datei: \(file)
                Pfad: \(context.codingPath.path)
                """
            )
        } catch let DecodingError.valueNotFound(type, context) {
            fatalError(
                """
                ❌ Fehlender Wert für \(type)
                Datei: \(file)
                Pfad: \(context.codingPath.path)
                """
            )
        } catch let DecodingError.dataCorrupted(context) {
            fatalError(
                """
                ❌ Ungültige JSON-Daten.
                Datei: \(file)
                Pfad: \(context.codingPath.path)
                \(context.debugDescription)
                """
            )
        } catch {
            fatalError(
                """
                ❌ \(file) konnte nicht decodiert werden.
                \(error)
                """
            )
        }
    }
}

// MARK: - Coding Path

extension Array where Element == CodingKey {

    fileprivate var path: String {
        guard !isEmpty else {
            return "Root"
        }

        return map(\.stringValue)
            .joined(separator: " → ")
    }
}
