//
//  NotificationTitleWithGridCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct NotificationTitleWithGridCell: View {
    
    let notification: NotificationModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text(notification.dayTitle)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(.neutral60))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(notification.notifications, id: \.self) { notificationData in
                    NotificationCell(notification: notificationData)
                }
            }
        }
    }
}
