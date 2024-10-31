//
//  NavigationButton.swift
//  FoodDelivery
//
//  Created by Neosoft on 31/10/24.
//


import SwiftUI

struct NavigationButton<Destination: View>: View {
    let title: String
    let destination: Destination
   
    var body: some View {
        NavigationLink(destination: destination) {
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


