//
//  PlanetsResponse.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 16/06/23.
//

import Foundation

//MARK: - Planets
struct Planet: Codable {
    let name: String
}

struct Planets: Codable {
    let count: Int
    let results: [Planet]?
}

