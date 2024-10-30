//
//  OnboardingViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    
    @Published var currentIndex: Int = 0
    @Published var totalIndex = 3
    
    var backgroundImage: ImageConstants {
        let images: [ImageConstants] = [
         .firstOnboardingBg,
         .secondOnboardingBg,
         .thirdOnboardingBg
        ]
        return images[currentIndex]
    }
    let title = "We serve\nincomparable\ndelicacies"
    let subTitle = "All the best restaurants with their top menu waiting for you, they cant’t wait for your order!!"
}
