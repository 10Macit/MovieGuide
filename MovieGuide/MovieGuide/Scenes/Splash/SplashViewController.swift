//
//  SplashViewController.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit
import FirebaseRemoteConfig
import MovieGuideAPI
import Alamofire

class SplashViewController: UIViewController {
    
    let network = NetworkReachabilityManager()!
    @IBOutlet weak var messageLbl: UILabel!
    let service: MovieServiceProtocol = MovieService()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard network.isReachable else {
            showAlert()
            return
        }
        
        fetchMessages()
        
    }
    
    func showAlert(){
        let networkAlert = UIAlertController(title: "No connection!", message: nil, preferredStyle: .alert)
        networkAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(networkAlert, animated: true, completion: nil)
    }
    
    func fetchMessages(){
        let fetchDuration: TimeInterval = 0
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) { status, error in
            
            if let error = error {
                print("Uh-oh. Got an error fetching remote values \(error)")
                return
            }
            
            RemoteConfig.remoteConfig().activate()
            self.updateMessage()
            print("Retrieved values from the cloud!")
        }
    }
    
    func updateMessage(){
        if let message = RemoteConfig.remoteConfig().configValue(forKey: "message").stringValue, message.count > 0 {
            messageLbl.text = message
            openMovieSearchScreen()
        }
    }
    
    func openMovieSearchScreen(){
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.splashTime) {
            let movieSearchViewController = MovieSearchBuilder.makeNavigationController(viewController: MovieSearchBuilder.make())
            self.show(movieSearchViewController, sender: nil)
        }
    }
}
