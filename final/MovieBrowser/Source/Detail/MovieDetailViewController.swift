//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieSelected: Movie?
    private let viewModel = MovieDetailViewModel()
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        titleLabel.text = movieSelected?.originalTitle
        overviewLabel.text = movieSelected?.overview
        releaseDateLabel.text = "Release Date: \(movieSelected?.releaseDate ?? "")" 
        
        self.imageView.image = nil
        let posterPath = movieSelected?.posterPath
        viewModel.download(posterPath: posterPath) { [weak self] data in
            if let data = data {
                self?.imageView.image = UIImage(data: data)
            }
        }
    }
}
