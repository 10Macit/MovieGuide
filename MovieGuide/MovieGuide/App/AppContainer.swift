//
//  AppContainer.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation
import MovieGuideAPI

let app = AppContainer()

final class AppContainer{
    
    let router = AppRouter()
    let service = MovieService()
    
}
