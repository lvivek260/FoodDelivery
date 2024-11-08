//
//  TabModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct TabModel: Identifiable {
    let id = UUID()
    let view: AnyView
    let image: ImageConstants
    let text: String
}
