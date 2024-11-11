//
//  View+Extension.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

extension View {
    func customNavigation() -> some View {
        self.modifier(CustomNavigationModifier())
    }
}
