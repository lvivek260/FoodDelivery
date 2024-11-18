//
//  MyRecentOrdersCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 18/11/24.
//

import SwiftUI

struct MyRecentOrdersCell: View {
    let order: RecentOrderModel
    
    var body: some View {
        HStack(spacing: 10) {
            imageView
            
            VStack(alignment: .leading, spacing: 8) {
                titleView
                subTitleView
                HStack(spacing: 10) {
                    ratingView
                    distanceView
                }
            }
            
            Spacer()
        }
    }
    
    private var imageView: some View {
        Image(order.image)
            .resizable()
            .frame(width: 70, height: 65)
    }
    
    private var titleView: some View {
        Text(order.title)
            .font(.system(size: 16, weight: .semibold))
    }
    
    private var subTitleView: some View {
        Text(order.subTitle)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(Color(.neutral60))
    }
    
    private var ratingView: some View {
        HStack(spacing: 4) {
            Image(.starFill)
                .resizable()
                .frame(width: 16, height: 16)
            
            Text(order.rating)
                .font(.system(size: 12, weight: .medium))
        }
    }
    
    private var distanceView: some View {
        HStack(spacing: 4) {
            Image(.locationIcon)
                .resizable()
                .frame(width: 16, height: 16)
            
            Text(order.distance)
                .font(.system(size: 12, weight: .medium))
        }
    }
}

