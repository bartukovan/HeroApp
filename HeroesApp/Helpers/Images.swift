//
//  Images.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit

struct Images {
    enum ImageNames: String {
        case backIcon = "back.png"
        case emptyStar = "emptyStar.png"
        case fullStar = "fullStar.png"
    }
    
    static func getImage(_ image: ImageNames) -> UIImage? {
        guard let image = UIImage(named: image.rawValue) else { return nil }
        return image
    }
}
