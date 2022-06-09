//
//  CharactersService.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import Alamofire

struct CharacterService {
    static func getCharacters(charName: String, limit: Int, offSet: Int, completion:@escaping (AFResult<CharacterModel>) -> Void) {
        APIClient.decodableRequest(route: APIRouter.getCharacters(charName: charName, limit: limit, offSet: offSet), completion: completion)
    }
}
