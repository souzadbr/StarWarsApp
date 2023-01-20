//
//  NetworkClientProtocol.swift
//  StarWarsProjectApp
//
//  Created by Debora Rodrigues  on 19/01/23.
//

import Foundation

protocol NetworkClientProtocol {
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ())
}

final class NetworkClient: NetworkClientProtocol {

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {

        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let _ = error {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            completion(data)
        }
        task.resume()
    }
}
