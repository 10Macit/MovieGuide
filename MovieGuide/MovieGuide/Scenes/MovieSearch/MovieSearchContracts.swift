//
//  MovieSearchContracts.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation


protocol MovieSearchViewProtocol {
    var delegate: MovieSearchViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation])
    func setLoading(_ isLoading: Bool)
}


protocol MovieSearchViewDelegate: class {
    func didSelect(at index:Int)
    func search(with name:String)
}

