//
//  NotificationCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct NotificationCell: View {
    let notification: Notifications
    
    var body: some View {
        HStack(spacing: 16) {
            imageView
            
            VStack(alignment: .leading, spacing: 4) {
                title
                subTitle
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var imageView: some View {
        Image(notification.image)
            .resizable()
            .frame(width: 48, height: 48)
    }
    
    private var title: some View {
        Text(notification.title)
            .font(.system(size: 16, weight: .semibold))
    }
    
    private var subTitle: some View {
        Text(notification.subTitle)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(Color(.neutral60))
    }
}
