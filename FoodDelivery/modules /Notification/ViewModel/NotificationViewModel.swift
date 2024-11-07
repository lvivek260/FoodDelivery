//
//  NotificationViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import Foundation

final class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationModel] = [
        .init(dayTitle: "Today", notifications: [
            .init(image: .notification1, title: "30% Special Discount!", subTitle: "Special promotion only valid today"),
            .init(image: .notification2, title: "Your Order Has Been Taken by the Driver", subTitle: "Recentyl"),
            .init(image: .notification3, title: "Your Order Has Been Canceled", subTitle: "19 Jun 2023"),
        ]),
        
        .init(dayTitle: "Yesterday", notifications: [
            .init(image: .notification4, title: "30% Special Discount!", subTitle: "Special promotion only valid today"),
            .init(image: .notification5, title: "Account Setup Successfull!", subTitle: "Special promotion only valid today"),
            .init(image: .notification1, title: "Special Offer! 60% Off", subTitle: "Special offer for new account, valid until 20 Nov 2022"),
            .init(image: .notification6, title: "Credit Card Connected", subTitle: "Special promotion only valid today"),
        ]),
    ]
}
