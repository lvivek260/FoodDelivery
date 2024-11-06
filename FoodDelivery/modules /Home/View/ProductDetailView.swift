//
//  ProductDetailView.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                imageView
                titlePriceView
                timeRatingDetailView
                Divider()
                descriptionView
                VStack(spacing: 8) {
                    recomendedForYouTitleView
                    recomendedForYouGridView
                }
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
            ImageTitleView(title: "Free Delivery", image: .dollar)
            Spacer()
            ImageTitleView(title: "20 - 30", image: .clock)
            Spacer()
            ImageTitleView(title: "4.5", image: .starFill)
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.primaryHover).opacity(0.04))
        }
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(.system(size: 16, weight: .semibold))
            Text("Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.neutral60))
        }
    }
    
    private var recomendedForYouTitleView: some View {
        HStack {
            Text("Recomended For You")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
            Button(action: {}) {
                Text("See All")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(.primaryHover))
            }
        }
        .padding(.horizontal, 8)
    }
    
    private var recomendedForYouGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 22), GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.categoryContent, id: \.self) { content in
                CategoryContentCell(content: content)
            }
        }
        .padding(.horizontal, 8)
    }
}

fileprivate struct ImageTitleView: View {
    let title: String
    let image: ImageConstants
    
    var body: some View {
        HStack(spacing: 8) {
            Image(image)
          
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.neutral60))
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
