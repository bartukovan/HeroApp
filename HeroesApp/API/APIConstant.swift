//
//  APIConstant.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation

struct APIConstant {
    static let baseURL = "https://gateway.marvel.com/"
    static let apiKey = "ce4413c09311f5d2c74cd2d7204ea541"
    static let hash = "1a60272ce3bd85d729c3ec596661e9a6" 
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
