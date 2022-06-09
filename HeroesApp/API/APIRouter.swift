//
//  APIRouter.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getCharacters(charName: String, limit: Int, offSet: Int)
    
    private var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .getCharacters(charName: let charName, limit: let limit, offSet: let offSet):
            return ["nameStartsWith": charName, "limit": limit, "offset": offSet, "apikey": APIConstant.apiKey, "hash": APIConstant.hash, "ts": 1]
        }
    }
    
    private var path: String {
        switch self {
        case .getCharacters:
            return "/public/characters"
        }
    }
    
    private var version: String {
        switch self {
        default:
            return "v1"
        }
    }
    
    private var apiKey: String {
        switch self {
        default:
            return APIConstant.apiKey
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url: URL
        switch self {
        default:
            url = try APIConstant.baseURL.asURL()
        }
        
        let versionAddedUrl = url.appendingPathComponent(version)
        var urlRequest = URLRequest(url: versionAddedUrl.appendingPathComponent(path))
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if self.method == Alamofire.HTTPMethod.post {
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: self.parameters)
        } else if self.method == Alamofire.HTTPMethod.put {
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: self.parameters)
        } else {
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: self.parameters)
        }
    }
}
