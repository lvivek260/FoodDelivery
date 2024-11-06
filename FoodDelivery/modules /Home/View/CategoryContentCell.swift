//
//  CategoryContentCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import SwiftUI

struct CategoryContentCell: View {
    let content: CategoryContent
    @State var isLike: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            
            ZStack {
                imageView
                likeButtonView
            }
            
            VStack(spacing: 6) {
                VStack(spacing: 4) {
                    titleView
                    
                    HStack {
                        ratingView
                        Spacer()
                        locationView
                    }
                }
                
                priceView
            }
        }
        .padding(8)
        .background(backgroundView)
    }
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 12.0)
            .fill(.white)
    }
    
    private var likeButtonView: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isLike.toggle()
                }) {
                    Image(systemName: "heart" + (isLike ? ".fill" : ""))
                        .foregroundColor(.red)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 30, height: 30)
                        }
                }
            }
            Spacer()
        }
        .padding(16)
    }
    
    private var imageView: some View {
        Image(content.image)
            .resizable()
            .frame(height: 106)
            .cornerRadius(8)
    }
    
    private var titleView: some View {
        Text(content.title)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(Color(.neutral100))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var ratingView: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color(.primaryHover))
            Text(content.rating)
                .font(.system(size: 12, weight: .medium))
        }
    }
    
    private var locationView: some View {
        HStack(spacing: 4) {
            Image(.locationIcon)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color(.primaryHover))
            Text(content.location)
                .font(.system(size: 12, weight: .medium))
        }
    }
    
    private var priceView: some View {
        Text(content.price)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color(.primaryHover))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
