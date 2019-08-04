//
//  ApiRouter.swift
//  MovieGuideAPI
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Alamofire

enum ApiRouter {
    case movieSearch(params: [String: String])
    case movieDetail(params: [String: String])
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
        switch self {
        case .movieSearch, .movieDetail:
            return "/"
        }
    }
    
    
    
     MARK: - Parameters
    private var parameters: [String: String] {
        switch self {
        case .movieSearch(let params), .movieDetail(let params):
            return params
        }
    }
    
    
    private func getURL() -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = Constant.baseURL
        urlComponents.path = path
        urlComponents.setQueryItems(with: parameters)
        return urlComponents.url!
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = getURL()
        
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        return urlRequest
    }
}


extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
