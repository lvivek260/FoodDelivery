//
//  ChatCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct ChatCell: View {
    
    let chat: ChatModel
    
    var body: some View {
        HStack(spacing: 8) {
            imageView
            titleSubTitle
            
            Spacer()
            
            timeAndStatus
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color(.neutral10))
        .cornerRadius(12)
    }
    
    private var imageView: some View {
        Image(chat.image)
            .resizable()
            .cornerRadius(.infinity)
            .frame(width: 40, height: 40)
    }
    
    private var titleSubTitle: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(chat.title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(.neutral100))
            
            Text(chat.subTitle)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color(.neutral60))
        }
    }
    
    private var timeAndStatus: some View {
        VStack(spacing: 4) {
            Text(chat.time)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color(.neutral60))
            
            switch chat.status {
            case .non:
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 20, height: 20)
                
            case .read:
                Image(.readIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
                
            case .message(let index):
                Text(index.description)
                    .foregroundColor(.white)
                    .font(.system(size: 10, weight: .medium))
                    .padding(6)
                    .background(
                        Circle()
                            .fill(Color(.primaryHover))
                    )
            }
        }
    }
}
