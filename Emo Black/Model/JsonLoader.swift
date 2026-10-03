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
        as type: T.Type = T.self,
        decoder: JSONDecoder = JSONDecoder()
    ) -> T {

        guard
            let url = url(
                forResource: file,
                withExtension: nil
            )
        else {
            fatalError(
                """
                ❌ JSON-Datei nicht gefunden.
                Datei: \(file)
                Bundle: \(bundleURL.lastPathComponent)
                """
            )
        }

        let data: Data

        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError(
                """
                ❌ JSON-Datei konnte nicht gelesen werden.
                Datei: \(file)
                Fehler: \(error.localizedDescription)
                """
            )
        }

        do {
            return try decoder.decode(type, from: data)
        } catch let error as DecodingError {
            fatalError(
                error.description(file: file)
            )
        } catch {
            fatalError(
                """
                ❌ JSON konnte nicht decodiert werden.
                Datei: \(file)
                Fehler: \(error.localizedDescription)
                """
            )
        }
    }
}

// MARK: - Decoding Error

extension DecodingError {

    fileprivate func description(file: String) -> String {
        switch self {

        case .keyNotFound(let key, let context):
            return """
                ❌ Fehlender JSON-Key.
                Datei: \(file)
                Key: \(key.stringValue)
                Pfad: \(context.codingPath.path)
                \(context.debugDescription)
                """

        case .typeMismatch(let type, let context):
            return """
                ❌ Falscher Datentyp.
                Datei: \(file)
                Erwartet: \(type)
                Pfad: \(context.codingPath.path)
                \(context.debugDescription)
                """

        case .valueNotFound(let type, let context):
            return """
                ❌ Fehlender JSON-Wert.
                Datei: \(file)
                Erwartet: \(type)
                Pfad: \(context.codingPath.path)
                \(context.debugDescription)
                """

        case .dataCorrupted(let context):
            return """
                ❌ Ungültige JSON-Daten.
                Datei: \(file)
                Pfad: \(context.codingPath.path)
                \(context.debugDescription)
                """

        @unknown default:
            return """
                ❌ Unbekannter Decoding-Fehler.
                Datei: \(file)
                \(self)
                """
        }
    }
}

// MARK: - Coding Path

extension Array where Element == CodingKey {

    fileprivate var path: String {
        guard !isEmpty else {
            return "Root"
        }

        return map { key in
            if let index = key.intValue {
                return "[\(index)]"
            }

            return key.stringValue
        }
        .joined(separator: " → ")
    }
}
