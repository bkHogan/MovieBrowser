//
//  FakeNetwork.swift
//  MovieBrowserTests
//
//  Created by Brian Keith Hogan on 10/01/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
@testable import MovieBrowser

class FakeNetwork: Network {
    
    var data: Data?
    var error: NetworkError?
    
    override func getMovies(from url: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void ) {
        
        if let error = error {
            completion(.failure(error))
        }
        
        if let data = data {
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                fatalError()
            }
        }
    }
    
    override func getData(from url: String, completion: @escaping (Result<Data, NetworkError>) -> Void ) {
        
        if let error = error {
            completion(.failure(error))
        }
        
        if let data = data {
            completion(.success(data))
        }
    }
}
