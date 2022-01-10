//
//  MovieResponse.swift
//  MovieBrowser
//
//  Created by Brian Keith Hogan on 10/01/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
}
