//
//  MovieDetailBuilder.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit
import MovieGuideAPI

final class MovieDetailBuilder{
    
    static func make(with movie: Movie) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.movie = movie
        viewController.service = app.service
        return viewController
    }
}
