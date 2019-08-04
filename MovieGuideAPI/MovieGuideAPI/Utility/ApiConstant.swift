//
//  Constant.swift
//  MovieGuideAPI
//
//  Created by Samet Macit on 4.08.2019.
//  Copyright © 2019 Samet Macit. All rights reserved.
//

import Foundation


public class ApiConstant {
    
    static let baseURL = "omdbapi.com"
    public static let apiKey = "a145db2f"
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
