//
//  ExtraCardView.swift
//  FoodDelivery
//
//  Created by Neosoft on 12/11/24.
//

import SwiftUI

struct ExtraCardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                cardView
                creditCardGridView
            }
            .padding(24)
        }
        .navigationTitle("Extra Card")
        .customNavigation()
    }
    
    private var cardView: some View {
        VStack(alignment: .leading, spacing: 34) {
            Text("SoCard")
                .font(.system(size: 18, weight: .semibold))
            
            Text("••••  ••••  ••••  8374")
                .font(.system(size: 24, weight: .medium))
            
            HStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Card holder name")
                        .font(.system(size: 10, weight: .regular))
                    Text("•••  •••")
                        .font(.system(size: 14, weight: .medium))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Expiry date")
                        .font(.system(size: 10, weight: .regular))
                    Text("••• / •••")
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                Image(.twoCirclesIcon)
            }
        }
        .padding(24)
        .foregroundColor(.white)
        .background{
            Image(.extraCardBackground)
                .resizable()
                .cornerRadius(16)
        }
    }
    
    private var creditCardGridView: some View {
        VStack {
            Text("Credit card")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16, weight: .medium))
            
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(0...10, id: \.self) { value in
//                    CreditCardCell(card: CardModel, selectedCard: Binding<CardModel>)
                    EmptyView()
                }
            }
        }
    }
}

struct ExtraCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraCardView()
    }
}
