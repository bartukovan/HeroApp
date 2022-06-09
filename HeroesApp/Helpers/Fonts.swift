//
//  Fonts.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation
import UIKit

struct Fonts {
    enum FontNames: String {
        case vRegular = "Verdana"
        case vBold = "Verdana-Bold"
    }
    
    static func getFont(_ font: FontNames, size: CGFloat) -> UIFont? {
        guard let font = UIFont(name: font.rawValue, size: size) else { return nil }
        return font
    }
}

