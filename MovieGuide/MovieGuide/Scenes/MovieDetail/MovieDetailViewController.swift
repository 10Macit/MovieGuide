//
//  MovieDetailViewController.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit
import MovieGuideAPI

final class MovieDetailViewController: UIViewController {
    @IBOutlet var movieDetailView: MovieDetailView!
    var movie: Movie!
    
    var service: MovieServiceProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = movie.title
        
        movieDetailView.setLoading(true)
        service.fetchMovieDetail(params: ["i" : movie.imdbId,"apiKey":ApiConstant.apiKey]) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.movieDetailView.updateMovieDetail(MovieDetailPresentation(movie: value))
                print(result)
            case .failure(let error):
                print(error)
            }
            self.movieDetailView.setLoading(false)
        }
    }
}
