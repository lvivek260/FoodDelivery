//
//  HomeViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var selectedCategory: Category?
    
    var categorys: [Category] = [
        .init(imageName: .burgerIcon, title: "Burger"),
        .init(imageName: .tacoIcon, title: "Taco"),
        .init(imageName: .drinkIcon, title: "Drink"),
        .init(imageName: .pizzaIcon, title: "Pizza")
    ]
    
    var categoryContent: [CategoryContent] = [
        .init(image: .burger1, title: "Ordinary Burgers", location: "190m", rating: "4.9", price: "$ 17,230"),
        .init(image: .burger2, title: "Burger With Meat", location: "190m", rating: "4.9", price: "$ 17,230"),
        .init(image: .burger3, title: "Ordinary Burgers", location: "190m", rating: "4.9", price: "$ 17,230"),
        .init(image: .burger4, title: "Burger With Meat", location: "190m", rating: "4.9", price: "$ 17,230"),
        .init(image: .burger1, title: "Ordinary Burgers", location: "190m", rating: "4.1", price: "$ 17,230"),
        .init(image: .burger2, title: "Burger With Meat", location: "190m", rating: "4.2", price: "$ 17,230"),
        .init(image: .burger3, title: "Ordinary Burgers", location: "190m", rating: "4.3", price: "$ 17,230"),
        .init(image: .burger4, title: "Burger With Meat", location: "190m", rating: "4.4", price: "$ 17,230"),
    ]
    
}