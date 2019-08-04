//
//  MovieSearchCell.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit

class MovieSearchCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var gradientView: UIView!
    override func awakeFromNib() {
        gradientView.setGradientBackground(colorTop: .clear, colorBottom: .black)
    }
}
