//
//  CartModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 18/11/24.
//

import Foundation

struct CartModel: Hashable {
    var isOn: Bool
    var intake: Int
    let image: ImageConstants
    let title: String
    let price: String
}
