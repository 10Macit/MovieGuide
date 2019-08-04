//
//  SplashBuilder.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit

final class SplashBuilder{
    
    static func make() -> SplashViewController{
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        //viewController.service = app.service
        return viewController
    }
}
