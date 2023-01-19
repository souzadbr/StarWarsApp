//
//  APIResponse.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//

import Foundation

//Struct dos dados relacionados a Filmes
struct Film: Codable {
    let  title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case releaseDate = "release_date"
        
    }
    
    init(title: String, episodeId: Int,openingCrawl: String,director: String, releaseDate: String ) {
        self.title = title
        self.episodeId = episodeId
        self.openingCrawl = openingCrawl
        self.director = director
        self.releaseDate = releaseDate
    }
}

//Struct sumario de filmes que usa de uma composicao de Filmes.
struct FilmSummary: Codable {
    let count: Int
    let results: [Film]
}

struct People: Codable {
    let count: Int
    let next: String?
    let prev: String?
    let results: [Person]?
}

struct Person: Codable {
    let name: String
}

