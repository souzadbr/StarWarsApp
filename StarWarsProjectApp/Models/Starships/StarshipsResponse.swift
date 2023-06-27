//
//  StarshipsResponse.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 16/06/23.
//

import Foundation

//MARK: - Starships
struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
}

struct Starships: Codable {
    let count: Int
    let results: [Starship]?
}
