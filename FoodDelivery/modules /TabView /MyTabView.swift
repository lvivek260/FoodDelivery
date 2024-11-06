//
//  TabView.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            OnboardingView()
                .tabItem {
                   Text("Home")
                }
        }
    }
}
