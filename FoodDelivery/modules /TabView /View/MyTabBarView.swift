//
//  TabView.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import SwiftUI

struct MyTabBarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(.homeTabIcon)
                        Text("Home")
                    }
                }
                
            ChatListView()
                .tabItem {
                    VStack {
                        Image(.messageTabIcon)
                        Text("Chat")
                    }
                }
        }
        .tint(Color(.primaryHover))
    }
    
}


// MARK: - Preview
struct MyTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabBarView()
    }
}
