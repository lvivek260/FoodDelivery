//
//  ExtraCardViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 13/11/24.
//

import Foundation

final class ExtraCardViewModel: ObservableObject {
    @Published var selectedCard: CardModel?
    @Published var cards: [CardModel] = [
        .init(name: "MasterCard", number: "**** **** 0783 7873", icon: .mastercardIcon),
        .init(name: "Paypal", number: "**** **** 0582 4672", icon: .paypalIcon),
        .init(name: "Apple Pay", number: "**** **** 0683 8973", icon: .applePayIcon)
    ]
}
