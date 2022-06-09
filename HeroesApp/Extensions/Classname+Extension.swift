//
//  Classname+Extension.swift
//  HeroesApp
//
//  Created by Bartu Kovan on 8.06.2022.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self.self)
    }
}
