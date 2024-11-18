//
//  CartProductCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 18/11/24.
//

import SwiftUI


struct CartProductCell: View {
    
    @Binding var cartProduct: CartModel
    var deleteButtonClick: ()->Void
    
    var body: some View {
        HStack(spacing: 16) {
            selectionButton
            productImageView
            
            VStack(alignment: .leading, spacing: 8) {
                titleView
                priceView
                
                HStack(spacing: 16) {
                    subtractButton
                    totalProductCount
                    addButton
                    Spacer()
                    deleteProductButton
                }
            }
        }
        .padding(12)
        .background(Color(.neutral10))
        .cornerRadius(12)
        
    }
    
    private var selectionButton: some View {
        CustomToggleButton(isOn: $cartProduct.isOn)
            .frame(width: 20, height: 20)
    }
    
    private var productImageView: some View {
        Image(cartProduct.image)
            .resizable()
            .frame(width: 85, height: 82)
            .cornerRadius(8)
    }
    
    private var titleView: some View {
        Text(cartProduct.title)
            .font(.system(size: 16, weight: .semibold))
    }
    
    private var priceView: some View {
        Text(cartProduct.price)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color(.primaryHover))
    }
    
    private var addButton: some View {
        Button(action: {
            cartProduct.intake += 1
        }) {
            Image(.plusIcon)
                .resizable()
                .frame(width: 28, height: 28)
        }
    }
    
    private var subtractButton: some View {
        Button(action: {
            cartProduct.intake -= 1
        }) {
            Image(.minusIcon)
                .resizable()
                .frame(width: 28, height: 28)
        }
    }
    
    private var totalProductCount: some View {
        Text(cartProduct.intake.description)
            .font(.system(size: 14, weight: .medium))
    }
    
    private var deleteProductButton: some View {
        Button(action: {
            deleteButtonClick()
        }) {
            Image(.deleteIcon)
                .resizable()
                .frame(width: 28, height: 28)
        }
    }
}
