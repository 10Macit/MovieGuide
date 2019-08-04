//
//  MovieService.swift
//  MovieGuideAPI
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation
import Alamofire


public enum Error: Swift.Error {
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

public protocol MovieServiceProtocol {
    func fetchSearchMovies(params: [String: String], completion: @escaping (Result<Search,Error>) -> Void)
    func fetchMovieDetail(params: [String: String], completion: @escaping (Result<Movie,Error>) -> Void)
}

public class MovieService: MovieServiceProtocol {
    
    public init() {}
    
    public func fetchSearchMovies(params: [String: String], completion: @escaping (Result<Search, Error>) -> Void) {
        Service.performRequest(route: ApiRouter.movieSearch(params: params), completion: completion)
    }
    
    public func fetchMovieDetail(params: [String: String], completion: @escaping (Result<Movie, Error>) -> Void) {
        Service.performRequest(route: ApiRouter.movieDetail(params: params), completion: completion)
    }
}


final class Service {
    public static func performRequest<T:Decodable>(route: ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,Error>)->Void) {
        AF.request(route)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        completion(.success(result))
                    } catch {
                        completion(.failure(Error.serializationError(internal: error)))
                    }
                case .failure(let error):
                    completion(.failure(Error.networkError(internal: error)))
                }
        }
    }
}
