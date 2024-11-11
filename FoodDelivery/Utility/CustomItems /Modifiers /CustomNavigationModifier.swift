//
//  CustomNavigationModifier.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct CustomNavigationModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton()
                }
            }
    }
}
