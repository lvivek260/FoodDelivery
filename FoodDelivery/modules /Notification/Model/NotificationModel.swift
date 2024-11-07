//
//  NotificationModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import Foundation

struct NotificationModel: Hashable {
    let dayTitle: String
    let notifications: [Notifications]
}

struct Notifications: Hashable {
    let image: ImageConstants
    let title: String
    let subTitle: String
}
