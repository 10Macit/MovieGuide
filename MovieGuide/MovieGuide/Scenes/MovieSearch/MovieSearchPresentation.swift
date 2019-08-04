//
//  MovieSearchPresentation.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation
import MovieGuideAPI

struct MoviePresentation {
    let title: String
    let image: URL
    let year: String
}

extension MoviePresentation {
    
    init(movie: Movie) {
        self.init(title: movie.title, image: movie.poster, year: movie.year)
    }
}
