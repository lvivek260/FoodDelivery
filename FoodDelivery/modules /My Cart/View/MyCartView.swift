//
//  MyCartView.swift
//  FoodDelivery
//
//  Created by Neosoft on 18/11/24.
//

import SwiftUI

struct MyCartView: View {
    @ObservedObject private var viewModel = CartViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.cartProducts.isEmpty {
                productEmptyView
            } else {
                productContentView
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("My Cart")
        .background(Color(.neutral20))
    }
    
// MARK: - Product Content View
    private var productContentView: some View {
        ScrollView {
            VStack(spacing: 24) {
                cartProductGridView
                paymentSummeryView
                orderNowButton
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
    }
    
    private var cartProductGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.cartProducts.indices, id: \.self) { index in
                CartProductCell(cartProduct: $viewModel.cartProducts[index]) {
                    viewModel.cartProducts.remove(at: index)
                }
            }
        }
    }
    
    private var paymentSummeryView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Payment Summary")
                .font(.system(size: 16, weight: .semibold))
            
            VStack(spacing: 16) {
                paymentSummeryDetail(
                    title: "Total Items (4)",
                    subTitle: viewModel.paymentDetail.totalItems
                )
                paymentSummeryDetail(
                    title: "Delivery Fee",
                    subTitle: viewModel.paymentDetail.deliveryFee
                )
                paymentSummeryDetail(
                    title: "Discount",
                    subTitle: viewModel.paymentDetail.discount,
                    color: Color(.primaryHover)
                )
                paymentSummeryDetail(
                    title: "Total",
                    subTitle: viewModel.paymentDetail.total
                )
            }
        }
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.neutral50).opacity(0.4))
        }
    }
    
    private var orderNowButton: some View {
        NavigationButton(title: "Order Now", destination: PaymentView())
    }
    
    // MARK: - if products is empty
    private var productEmptyView: some View {
        VStack(spacing: 40) {
            Spacer()
            emptyProductImage
            titleSubTitleView
            findFoodButton
            Spacer()
        }
    }
    
    private var emptyProductImage: some View {
        Image(.myCartEmptyView)
            .resizable()
            .aspectRatio(278/207, contentMode: .fit)
            .padding(.horizontal, 48)
    }
    
    private var titleSubTitleView: some View {
        VStack(spacing: 16) {
            Text("Ouch! Hungry")
                .font(.system(size: 24, weight: .bold))
            
            Text("Seems like you have not ordered any food yet")
                .multilineTextAlignment(.center)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color(.neutral60))
                .padding(.horizontal, 60)
        }
    }
    
    private var findFoodButton: some View {
        CustomButton(title: "Find Foods") {
            
        }
        .padding(.horizontal, 24)
    }
}


fileprivate struct paymentSummeryDetail: View {
    let title: String
    let subTitle: String
    var color: Color = .black
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(.neutral60))
            
            Spacer()
            
            Text(subTitle)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(color)
        }
    }
}


struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView()
    }
}
