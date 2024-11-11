//
//  SettingDataViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import Foundation

final class SettingDataViewModel: ObservableObject {
    @Published var isOnPushNotification: Bool = false
    @Published var isOnLocation: Bool = true
    @Published var selectedLanguage: LanguageModel = .init(name: "English (US)", flag: "🇺🇸")
    
    var languages: [LanguageModel] = [
        .init(name: "Indonesia", flag: "🇮🇩"),
        .init(name: "English (US)", flag: "🇺🇸"),
        .init(name: "Thailand", flag: "🇹🇭"),
        .init(name: "Chinese", flag: "🇨🇳"),
    ]
}
