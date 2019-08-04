//
//  ApiRouter.swift
//  MovieGuideAPI
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation


import UIKit
import Alamofire

enum ApiRouter {
    case movieSearch(items: [String: String])
    case movieDetail(items: [String: String])
}

extension ApiRouter: URLRequestConvertible {
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .movieSearch, .movieDetail:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        return "/"
        //        switch self {
        //        case .movieSearch(let movieName, let type, let page):
        //            return "/?s=\(movieName)&type=\(type)&page=\(page)"
        //        case .movieDetail(let imdbId):
        //            return "/?i=\(imdbId)"
        //        }
    }
    
    
    private var queryItems: [String: String] {
        
        switch self {
        case .movieDetail(let items),.movieSearch(let items):
            return items
        }
    }
    
    //
    //    private var apiKey: String {
    //        switch self {
    //        case .movieDetail,.movieSearch:
    //            return ("&apikey=" + ApiConstant.apiKey)
    //        }
    //    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        return nil
    }
    
    public func getURL() -> URL?{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = ApiConstant.baseURL
        urlComponents.path = path
        urlComponents.setQueryItems(with: queryItems)
        return urlComponents.url
    }
    
    //     MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = getURL()
        var urlRequest = URLRequest(url: url!)
        
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
    
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
