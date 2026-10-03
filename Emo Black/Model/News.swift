//
//  News.swift
//  Emo Black
//
//  Created by Tufan Cakir on 03.10.26.
//

import Foundation

struct News: Codable, Identifiable, Hashable {
    let id: String
    let version: String
    let title: String
    let message: String
    let date: String
}
