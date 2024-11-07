//
//  PaymentView.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                messegeTitleWithSubTitle
                productImagePriceTitleView
                
                VStack(spacing: 20) {
                    detailsTransactionView
                    Divider()
                    delivertoView
                }
                
                Spacer()

                chackoutNowButton
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
        }
        .navigationTitle("Payment")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton()
            }
        }
    }
    
    private var messegeTitleWithSubTitle: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("You deserve better meal")
                .font(.system(size: 14, weight: .light))
                .foregroundColor(Color(.neutral60))
            Text("Item Ordered")
                .font(.system(size: 14, weight: .semibold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var productImagePriceTitleView: some View {
        HStack(spacing: 12) {
            Image(.burger)
                .resizable()
                .frame(width: 80, height: 70)
                .cornerRadius(8.0)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Burger With Meat")
                    .font(.system(size: 14, weight: .semibold))
                Text("$ 12,230")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(.primaryHover))
            }
            
            Spacer()
            
            Text("14 items")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color(.neutral60))
        }
    }
    
    private var detailsTransactionView: some View {
        VStack(spacing: 16) {
            Text("Details Transaction")
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TitleValue(title: "Cherry Healthy", value: "$ 180.000")
            TitleValue(title: "Driver", value: "$ 50.000")
            TitleValue(title: "Tax 10%", value: "$ 80.390")
            TitleValue(title: "Total Price", value: "$ 100.000", isPrice: true)
        }
    }
    
    private var delivertoView: some View {
        VStack(spacing: 16) {
            Text("Deliver to :")
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TitleValue(title: "Name", value: "Albert Stevano")
            TitleValue(title: "Phone No.", value: "+12 8347 2838 28")
            TitleValue(title: "Address", value: "New York")
            TitleValue(title: "House No.", value: "BC54 Berlin")
            TitleValue(title: "City", value: "New York City")
        }
    }
    
    private var chackoutNowButton: some View {
        CustomButton(title: "Chackout Now") {
            
        }
    }
}

fileprivate struct TitleValue: View {
    let title: String
    let value: String
    var isPrice: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.neutral60))
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: isPrice ? .bold : .medium))
                .foregroundColor(Color(isPrice ? .primaryHover : .neutral100))
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
