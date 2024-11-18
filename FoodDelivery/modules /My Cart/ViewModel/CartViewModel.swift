//
//  CartViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 18/11/24.
//

import Foundation

struct PaymentModel {
    let totalItems: String
    let deliveryFee: String
    let discount: String
    let total: String
}

final class CartViewModel: ObservableObject {
    @Published var cartProducts: [CartModel] = [
        .init(isOn: true, intake: 1, image: .cart1, title: "Burger With Meat", price: "$ 12,230"),
        .init(isOn: true, intake: 1, image: .cart2, title: "Ordinary Burgers", price: "$ 12,230"),
        .init(isOn: true, intake: 1, image: .cart3, title: "Ordinary Burgers", price: "$ 12,230"),
    ]
    
    let paymentDetail = PaymentModel(
        totalItems: "$48,900",
        deliveryFee: "Free",
        discount: "-$10,900",
        total: "$38,000"
    )
}
