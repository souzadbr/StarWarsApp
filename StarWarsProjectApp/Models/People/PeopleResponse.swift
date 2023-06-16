//
//  PeopleResponse.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 16/06/23.
//

import Foundation

//MARK: - People

struct Person: Codable {
    let name: String
    let hairColor: String
    let skinColor: String
    let gender: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case hairColor = "hair_color"
        case skinColor = "skin_color"
    }
    
    init(name: String, hairColor: String, skinColor: String, gender: String ) {
        self.name = name
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.gender = gender
    }
}

struct People: Codable {
    let count: Int
    let results: [Person]?
}
