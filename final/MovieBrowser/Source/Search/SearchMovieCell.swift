//
//  SearchMovieCell.swift
//  MovieBrowser
//
//  Created by Brian Keith Hogan on 10/01/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchMovieCell: UITableViewCell {

    static let identifier = "SearchMovieCell"
    
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(title: String?, releaseDate: String?, voteAverage: String?) {
        titleLabel.text = title
        dateLabel.text = releaseDate
        voteAverageLabel.text =  voteAverage
    }
}
