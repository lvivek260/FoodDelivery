//
//  ProductDetailView.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                imageView
                titlePriceView
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
        .navigationTitle("About This Menu")
    }
    
    private var imageView: some View {
        Image(.burger)
            .resizable()
            .aspectRatio(393/295,contentMode: .fill)
            .cornerRadius(16)
        
    }
    
    private var titlePriceView: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text("Burger With Meat 🍔")
                .font(.system(size: 24, weight: .semibold))
                
            Text("$ 12,230")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(.primaryHover))
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var timeRatingDetailView: some View {
        HStack {
            ImageTitleView(title: "Free Delivery")
            ImageTitleView(title: "Free Delivery")
            ImageTitleView(title: "Free Delivery")
        }
    }
}

fileprivate struct ImageTitleView: View {
    let title: String
    let systemImage: String = ""
    let customImage: ImageConstants = .homeHeaderBg
    
    var body: some View {
        HStack(spacing: 8) {
            if systemImage.isEmpty {
                Image(customImage)
            } else {
                Image(systemName: systemImage)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.neutral60))
            }
          
            Text(title)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
