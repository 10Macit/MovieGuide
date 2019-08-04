//
//  MovieDetailView.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit
import Kingfisher

final class MovieDetailView: UIView {
    
    @IBOutlet weak var blurImageView: UIImageView! {
        didSet {
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = blurImageView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurImageView.addSubview(blurEffectView)
        }
    }
    
    @IBOutlet weak var posterImageView: UIImageView!

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
}

extension MovieDetailView: MovieDetailViewProtocol {
    func setLoading(_ isLoading: Bool) {
        if isLoading {
            indicatorView.startAnimating()
        } else {
            indicatorView.stopAnimating()

        }
    }
    
    func updateMovieDetail(_ movieDetail: MovieDetailPresentation) {
        titleLabel.text = movieDetail.title
        posterImageView.kf.setImage(with: movieDetail.image)
        blurImageView.kf.setImage(with: movieDetail.image)

    }
    
    
    
    
}
