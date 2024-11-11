//
//  NotificationView.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct NotificationView: View {
   
    @ObservedObject private var viewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                notificationGridView
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
        }
        .navigationTitle("Notification")
        .customNavigation()
    }
    
    private var notificationGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 24) {
            ForEach(viewModel.notifications, id: \.self) { notification in
                NotificationTitleWithGridCell(notification: notification)
                customDivider
            }
        }
    }
    
    private var customDivider: some View {
        Rectangle()
            .frame(height: 4.0)
            .foregroundColor(Color(.neutral30))
    }
}



struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
