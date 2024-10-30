//
//  CustomButton.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(Color(.primaryHover))
                .cornerRadius(.infinity)
        }
    }
}
