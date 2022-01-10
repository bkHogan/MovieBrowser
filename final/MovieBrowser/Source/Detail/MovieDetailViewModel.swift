//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by Brian Keith Hogan on 10/01/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    private let networkManager = Network()
    
    func download(posterPath: String?, completion: @escaping (Data?) -> Void) {
        guard let posterPath = posterPath else {
            completion(nil)
            return
        }
        let url = Network.imageURL.appending(posterPath)
        networkManager
            .getData(from: url) { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        completion(data)
                    }
                case .failure(let error):
                    // printing in console
                    print(error.localizedDescription)
                }
            }
    }
    
}
