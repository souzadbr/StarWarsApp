//
//  NetWorkManager.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 18/01/23.
//

import Foundation
import UIKit

final class NetworkManager {
    
    //variavel filme do tipo Film que recebe um array vazio
    var films: [Film] = []
    // constante privada que recebe a URL da API
    private let domainURLString = "https://swapi.co/api/"
    
    //funcao fetchFilms usa de completionHandler para fazer a chamada ao servidor de dados e aguardar o retorno enquanto o app faz outras coisas como carregar o restante da tela por exemplo.
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
                print ("Error with the response, unexpectd status code: \(response)")
                return
            }
            
            if let data = data,
               let filmSummary = try? JSONDecoder().decode(FilmSummary.self, from: data) {
                completionHandler(filmSummary.results ?? [])
            }
        })
        
        task.resume()
    }
    
//    func getURLFilms() -> String {
//
//        return  "https://swapi.dev/api/films/1"
//
//    }
//
//    func fetchFilm(_ completion: @escaping ([Film]) -> ()) {
//            let url = URL(string: getURLFilms())!
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in
//                guard let data = data else {
//                    return
//                }
//                do {
//                    let result = try JSONDecoder().decode(FilmSummary.self, from: data)
//                    completion(result.results)
//                } catch {
//                    print("Erro, não foi possível decodificar o JSON")
//                }
//            }
//        task.resume()
//
//    }
    private func fetchFilm(withID id: Int, completionHandler: @escaping (Film)-> Void) {

        let url = URL(string: domainURLString + "films/\(id)")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let error = error {
                print ("Error returning film in id \(id): \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code: \(response)")
                return
            }
            if let data = data,
               let film = try? JSONDecoder().decode(Film.self, from: data) {
                completionHandler(film)
            }
        })
        task.resume()
    }
}
