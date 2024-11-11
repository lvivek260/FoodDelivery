//
//  ProfileViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

final class ProfileSettingViewModel {
    let cellData: [ProfileModel] = [
        .init(title: "Profile", data: [
            .init(navigationView: AnyView(PersonalDataView()), title: "Personal Data", image: .profile1),
            .init(navigationView: AnyView(OnboardingView()), title: "Settings", image: .profile2),
            .init(navigationView: AnyView(OnboardingView()), title: "Extra Card", image: .profile3)
        ]),
        .init(title: "Support", data: [
            .init(navigationView: AnyView(OnboardingView()), title: "Help Center", image: .profile4),
            .init(navigationView: AnyView(OnboardingView()), title: "Request Account Deletion", image: .profile5),
            .init(navigationView: AnyView(OnboardingView()), title: "Add another account", image: .profile6)
        ])
    ]
}
