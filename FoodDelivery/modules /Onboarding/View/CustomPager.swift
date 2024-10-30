//
//  CustomPager.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct CustomPager: View {
    var totalIndex: Int
    @Binding var currentIndex: Int
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<totalIndex, id: \.self) { index in
                RoundedRectangle(cornerRadius: .infinity)
                    .frame(width: 24, height: 6)
                    .foregroundStyle(index == currentIndex ? Color(.white) : Color(.neutral50))
                    .scaleEffect(index == currentIndex ? 1.2 : 1)
                    .animation(.easeInOut(duration: 0.3), value: currentIndex)
            }
        }
    }
}
