//
//  ProductDetailView.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    @State var totalIntake: Int = 1
    
    var body: some View {
        ZStack {
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
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 80)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .background(Color(.neutral20))
            
            bottomAddToCartView
        }
        .customNavigation()
        .navigationTitle("About This Menu")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                shareToolBarButton
            }
        }
    }
    
    private var shareToolBarButton: some View {
        Button(action: {}) {
            Image(.shareIcon)
                .resizable()
                .frame(width: 32, height: 32)
        }
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
    
    private var bottomAddToCartView: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color.white.opacity(0.3))
                    .background(
                        BlurView(style: .regular)
                    )
              
                HStack {
                    addCartValueChangeView
                    Spacer().frame(width: 30)
                    addCartButton
                       
                }
                .padding(24)
            }
            .frame(height: 100)
        }
        .ignoresSafeArea()
    }
    
    private var addCartValueChangeView: some View {
        HStack(spacing: 12) {
            Button(action: {
                totalIntake -= 1
            }) {
                Image(.minusIcon)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Text(totalIntake.description)
                .font(.system(size: 16, weight: .bold))
            Button(action: {
                totalIntake += 1
            }) {
                Image(.plusIcon)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
    
    private var addCartButton: some View {
        NavigationLink(destination: PaymentView()) {
            HStack(spacing: 8) {
                Image(.shopIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Add To Cart")
                    .font(.system(size: 14, weight: .semibold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .foregroundStyle(.white)
            .background(Color(.primaryHover))
            .cornerRadius(.infinity)
        }
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
