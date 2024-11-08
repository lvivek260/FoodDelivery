//
//  ProfileModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct ProfileModel: Identifiable {
    let id = UUID()
    let title: String
    let data: [ProfileCellModel]
}

struct ProfileCellModel: Identifiable {
    let id = UUID()
    let navigationView: AnyView
    let title: String
    let image: ImageConstants
}
