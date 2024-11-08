//
//  TabViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

final class TabViewModel {
    let tabBarData: [TabModel] = [
        .init(view: AnyView(HomeView()), image: .homeTabIcon, text: "Home"),
        .init(view: AnyView(ChatListView()), image: .messageTabIcon, text: "Chat"),
        .init(view: AnyView(ProfileSettingView()), image: .personTabIcon, text: "Profile")
    ]
}
