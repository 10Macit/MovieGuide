//
//  MovieSearchBuilder.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import  UIKit

final class MovieSearchBuilder{
    
    static func makeNavigationController(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        return navigationController
    }
    
    static func make() -> MovieSearchViewController {
        let storyboard = UIStoryboard(name: "MovieSearch", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieSearchViewController") as! MovieSearchViewController
        viewController.service = app.service
        
        return viewController
    }
}
