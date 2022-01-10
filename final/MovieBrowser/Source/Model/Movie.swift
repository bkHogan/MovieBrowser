//
//  Movie.swift
//  MovieBrowser
//
//  Created by Brian Keith Hogan on 10/01/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let originalTitle: String
    let releaseDate: String?
    let voteAverage: Double?
    let posterPath: String?
    let overview: String?
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case overview
    }
    
    lazy var releaseDateFormatted: String? = {
        guard let dateString = releaseDate
        else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        guard let date = dateFormatter.date(from: dateString)
        else { return nil }
        dateFormatter.locale = Locale.current
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = nil
        return dateFormatter.string(from: date)
    }()
    
}
