//
//  MovieDetailContracts.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation

protocol MovieDetailViewProtocol {
    func updateMovieDetail(_ movieDetail: MovieDetailPresentation)
    func setLoading(_ isLoading: Bool)
}
