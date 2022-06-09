//
//  APIClient.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import Alamofire

class APIClient {
    
    @discardableResult
    static func decodableRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>) -> Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
//                print(response.result)
                completion(response.result)
            }
    }
}
