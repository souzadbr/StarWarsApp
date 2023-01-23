//
//  NetWorkManager.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//

import Foundation
import UIKit

final class NetworkManager{
    
    // constante privada que recebe a URL da API
    private let domainURLString = "https://swapi.dev/api/"
    
    // funcao fetchFilms usa de completionHandler para fazer a chamada ao servidor de dados e aguardar o retorno enquanto o app faz outras coisas como carregar o restante da tela por exemplo.
    func fetchFilms(completionHandler: @escaping ([Film])-> Void) {
        //url que concatena com o final films para puxar informacoes de filmes da API
        let url = URL(string: domainURLString + "films/")!
        //aqui o URLSEssion é um gerenciardor de dados e o dataTasks pede dados ao URLSEssion
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print ("Error with the response, unexpectd status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
                completionHandler(filmSummary.results ?? [])
            }
        })
        
        task.resume()
    }
    
    
    func fetchPeople(completionHandler: @escaping ([Person])-> Void) {
        
        let url = URL(string: domainURLString + "people/")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let error = error {
                print ("Error returning people. Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code: \(String(describing: response))")
                return
            }
            if let data = data,
               let peopleData = try? JSONDecoder().decode(People.self, from: data) {
                completionHandler(peopleData.results ?? [])
            }
        })
        task.resume()
    }
    
    func fetchPlanets(completionHandler: @escaping ([Planet])-> Void) {
        
        let url = URL(string: domainURLString + "planets/")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let error = error {
                print ("Error returning people. Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code: \(String(describing: response))")
                return
            }
            if let data = data,
               let planetData = try? JSONDecoder().decode(Planets.self, from: data) {
                completionHandler(planetData.results ?? [])
            }
        })
        task.resume()
    }
}



























