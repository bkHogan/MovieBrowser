//
//  SearchViewModel.swift
//  MovieBrowser
//
//  Created by Brian Keith Hogan on 10/01/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    var refreshMoviesList: (() -> Void)?
    
    private let networkManager: Network
    private var rowSelected: Int?
    private (set) var movies = [Movie]()
    
    init(networkManager:Network = Network()) {
        self.networkManager = networkManager
    }
    
    func search(by name: String) {
        let url = Network.movieURL.replacingOccurrences(of: Network.keySearch, with: name)
        networkManager
            .getMovies(from: url) { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.movies = movies
                    DispatchQueue.main.async {
                        self?.refreshMoviesList?()
                    }
                case .failure(let error):
                    // priting in console
                    print(error.localizedDescription)
                }
            }
    }
    
    func getMovieSelected() -> Movie? {
        guard let row = rowSelected else { return nil }
        return movies[row]
    }
    
    func getTitle(by row: Int) -> String? {
        movies[row].originalTitle
    }
    
    func getReleaseDate(by row: Int) -> String? {
        movies[row].releaseDateFormatted
    }
    
    func getVoteAverage(by row: Int) -> String? {
        guard let voteAverage = movies[row].voteAverage else { return nil }
        return "\(voteAverage)"
    }
    
    func select(row: Int) {
        rowSelected = row
    }
    
}
