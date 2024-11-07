//
//  ChatModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import Foundation

struct ChatModel: Hashable {
    let image: ImageConstants
    let title: String
    let subTitle: String
    let time: String
    let status: ChatStatus
}

enum ChatStatus: Hashable {
    case read
    case non
    case message(Int)
}
