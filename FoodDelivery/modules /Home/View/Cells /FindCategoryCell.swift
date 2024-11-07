//
//  FindCategoryCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import SwiftUI

struct FindCategoryCell: View {
    let category: Category
    @Binding var selectedCategory: Category?
    
    private var isSelected: Bool {
        return category == selectedCategory
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Image(category.imageName)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(category.title)
                .foregroundColor(Color(isSelected ? .neutral10 : .neutral60))
                .font(.system(size: 14, weight: .medium))
        }
        .padding([.vertical], 8)
        .frame(width: 60)
        .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(isSelected ? .primaryHover : .neutral10))
        )
       
    }
}
