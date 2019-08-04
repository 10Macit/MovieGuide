//
//  SplashViewController.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit
import MovieGuideAPI

class SplashViewController: UIViewController {
    
    let service: MovieServiceProtocol = MovieService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieList(searchText: "Bat")
        // Do any additional setup after loading the view.
    }
    
    func getMovieList(searchText:String){
        service.fetchSearchMovies(params: ["s" : searchText,
                                           "type": "movie",
                                           "page": "1",
                                           "apiKey":"a145db2f"])
        { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                print(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
