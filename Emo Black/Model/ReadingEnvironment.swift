//
//  ReadingEnvironment.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import SwiftUI

private struct IsReadingBookKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var isReadingBook: Binding<Bool> {
        get { self[IsReadingBookKey.self] }
        set { self[IsReadingBookKey.self] = newValue }
    }
}
