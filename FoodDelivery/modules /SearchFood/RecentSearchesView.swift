//
//  RecentSearchesView.swift
//  FoodDelivery
//
//  Created by Neosoft on 15/11/24.
//

import SwiftUI

struct RecentSearchesView: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 12) {
            searchImage
            titleView
            Spacer()
            cancelButton
        }
    }
    
    private var searchImage: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .frame(width: 24, height: 24)
            .tint(Color(.neutral60))
    }
    
    private var titleView: some View {
        Text(title)
            .font(.system(size: 16, weight: .regular))
    }
    
    private var cancelButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 24, height: 24)
                .tint(Color(.neutral60))
        }
    }
}

struct RecentSearchesView_Previews: PreviewProvider {
    static var previews: some View {
        RecentSearchesView(title: "Vivek")
    }
}
