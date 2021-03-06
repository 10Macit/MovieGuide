//
//  AppRouter.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit

final class AppRouter{
    
    let window: UIWindow
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(){
        let viewController = SplashBuilder.make()
      
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
