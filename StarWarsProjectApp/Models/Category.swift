//
//  ContactAPI.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 17/01/23.
//

import UIKit

//enum que será usado na variavel de titulo e icone para chamar Strings e Imagens.
enum Category {
    case films
    case planets
    case people
    case species
    case starships
    case vehicles
    
    //variavel title é do tipo String e retorna uma String
    var title: String {
        switch self {
        case .films: return "Films"
        case .planets: return "Planets"
        case .people: return "People"
        case .species: return "Species"
        case .starships: return "Starships"
        case .vehicles: return "Vehicules"
        }
    }
    
    //variavel retorna uma imagem optional que devera ser tratada para recebe-la.
    var icon: UIImage? {
        switch self {
        case .films: return UIImage(named: "iconVideoCamera")
        case .planets: return UIImage(named: "iconPlanet")
        case .people: return UIImage(named: "iconPerson")
        case .species: return UIImage(named: "iconPawPrint")
        case .starships: return UIImage(named: "iconDeathStar")
        case .vehicles: return UIImage(named: "iconScooter")
        }
    }
}



