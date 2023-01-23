//
//  APIResponse.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//

import Foundation


//Struct dos dados relacionados a Filmes
struct Film: Codable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        
        
    }
    
    init(title: String, episodeId: Int,openingCrawl: String) {
        self.title = title
        self.episodeId = episodeId
        self.openingCrawl = openingCrawl
        
    }
}

//Struct sumario de filmes que usa de uma composicao de Filmes.
struct FilmSummary: Codable {
    let count: Int
    let results: [Film]?
}

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

struct Planet: Codable {
    let name: String
}

struct Planets: Codable {
    let count: Int
    let results: [Planet]?
}
