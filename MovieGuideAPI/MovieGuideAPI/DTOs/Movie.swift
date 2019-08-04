//
//  Movie.swift
//  MovieGuideAPI
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation

// MARK: - Movie
public struct Movie: Decodable {
    public let title, year : String
    public let runtime, genre, director, imdbRate: String?
    public let plot, language: String?
    public let poster: URL
    public let imdbId: String
    public let type: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
        case language = "Language"
        case poster = "Poster"
        case imdbId = "imdbID"
        case imdbRate = "imdbRate"
    }
    
    public var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?,value:Any) -> (String,Any)? in
            guard label != nil else { return nil }
            return (label!,value)
        }).compactMap{ $0 })
        return dict
    }
}

//public enum TypeEnum: String, Decodable {
//    case movie = "movie"
//    case game = "game"
//    case series = "series"
//    case episode = "episode"
//}
