//
//  TabView.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import SwiftUI

struct MyTabBarView: View {
    
    private let viewModel = TabViewModel()
    
    var body: some View {
        TabView {
            ForEach(viewModel.tabBarData) { data in
                NavigationStack {
                    data.view
                }
                .tabItem {
                    VStack {
                        Image(data.image)
                        Text(data.text)
                    }
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
