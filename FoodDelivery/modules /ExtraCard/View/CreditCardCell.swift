//
//  CreditCardCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 12/11/24.
//

import SwiftUI

struct CreditCardCell: View {
    let card: CardModel
    @Binding var selectedCard: CardModel
    
    private var isSelected: Bool {
        return card == selectedCard
    }
    
    var body: some View {
        HStack(spacing: 16) {
            iconView
            
            VStack(alignment: .leading, spacing: 8) {
                nameTitleView
                numberView
            }
            
            Spacer()
            cardIconView
        }
        .padding(16)
        .background(Color(.neutral20))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color(.primaryHover) : Color(.neutral30))
        }
    }
    
    private var iconView: some View {
        Image(.whatsAppIcon)
            .resizable()
            .frame(width: 24, height: 24)
    }
    
    private var nameTitleView: some View {
        Text(card.name)
            .font(.system(size: 14, weight: .semibold))
    }
    
    private var numberView: some View {
        Text(card.number)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color(.neutral60))
    }
    
    private var cardIconView: some View {
        Image(.whatsAppIcon)
            .resizable()
            .frame(width: 24, height: 24)
    }
}

