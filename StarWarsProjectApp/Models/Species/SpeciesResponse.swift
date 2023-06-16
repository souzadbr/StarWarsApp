//
//  SpeciesResponse.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 16/06/23.
//

import Foundation

//MARK: -Species
struct Specie: Codable {
    let name: String
    let language: String
}

struct Species: Codable {
    let count: Int
    let results: [Specie]?
}
