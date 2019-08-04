//
//  UIViewController+Alert.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit


extension UIViewController {

    func showAlert(with title: String, message: String = "") {
        let networkAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        networkAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(networkAlert, animated: true, completion: nil)
    }

}
