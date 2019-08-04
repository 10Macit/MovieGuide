//
//  MovieSearchView.swift
//  MovieGuide
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import UIKit
import Kingfisher
import MovieGuideAPI


final class MovieSearchView: UIView {
    
    var delegate: MovieSearchViewDelegate?
    private var movieList: [MoviePresentation] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    //  @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
}

extension MovieSearchView: MovieSearchViewProtocol {
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
        //  tableView.reloadData()
        collectionView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool) {
        if isLoading {
            indicatorView.startAnimating()
        } else {
            indicatorView.stopAnimating()
        }
    }
    
    
}

extension MovieSearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            delegate?.search(with: searchText)
        } else {
            updateMovieList([])
        }
    }
}

extension MovieSearchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MovieSearchCell", for: indexPath) as! MovieSearchCell
        let movie = movieList[indexPath.row]
        cell.titleLabel.text = movie.title
        cell.yearLabel.text = movie.year
        
        cell.imageView.kf.setImage(with: movie.image)
        return cell
    }
}

extension MovieSearchView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}
