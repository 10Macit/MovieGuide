//
//  MovieSearchBuilder.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import  UIKit

final class MovieSearchBuilder{
    
    static func make() -> MovieSearchViewController {
        let storyboard = UIStoryboard(name: "MovieSearch", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieSearchViewController") as! MovieSearchViewController
        viewController.service = app.service
        return viewController
    }
}
