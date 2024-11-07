//
//  CustomBackButton.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: {
            dismiss() // Navigate back to the previous screen
        }) {
            Image(.backButtonIcon)
                .resizable()
                .frame(width: 32, height: 32)
        }
    }
}
