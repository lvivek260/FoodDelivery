//
//  Font+Extension.swift
//  FoodDelivery
//
//  Created by Neosoft on 29/10/24.
//

import SwiftUI

extension Font {
    static func customInterFont(_ size: CGFloat, _ weight: FontWeight) -> Font {
        return Font.custom("Inter-\(weight.rawValue)", size: size)
    }
    
    static func customInterFont(_ name: FontConstants, _ weight: FontWeight) -> Font {
        return Font.custom("Inter-\(weight.rawValue)", size: name.rawValue)
    }
}
