//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

enum NetworkError: Error {
    case badURL
    case other(Error)
}

class Network {
    
    private static let apiKey = "?api_key=5885c445eab51c7004916b9c0313e2d3"
    private static let baseURL = "https://api.themoviedb.org/3/"
    static let keySearch = "$KEY_SEARCH$"
    static let movieURL = "\(baseURL)search/movie\(apiKey)&query=\(keySearch)"
    static let imageURL = "https://image.tmdb.org/t/p/w500/"
    
    func getMovies(from url: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void ) {
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                    completion(.success(response.results))
                } catch let error {
                    completion(.failure(.other(error)))
                }
                return
            }
            fatalError()
        }
        .resume()
    }
    
    func getData(from url: String, completion: @escaping (Result<Data, NetworkError>) -> Void ) {
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            if let data = data {
                completion(.success(data))
                return
            }
            fatalError()
        }
        .resume()
    }
    
}
