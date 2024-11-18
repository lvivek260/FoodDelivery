//
//  SearchFoodView.swift
//  FoodDelivery
//
//  Created by Neosoft on 15/11/24.
//

import SwiftUI

struct SearchFoodView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                searchTextFeild
                categoryGridView
                RecentSearchesTitleView
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
        .background(Color(.neutral20))
        .navigationTitle("Search Food")
        .customNavigation()
    }
    
    private var searchTextFeild: some View {
        Rectangle()
            .frame(width: .infinity, height: 44)
    }
    
    private var categoryGridView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            let deviceWidth = UIScreen.main.bounds.width
            let contentWidth = (24.0*2) + (60.0*4)  // 24*2 padding, 60*4 cell width
            let spacing = (deviceWidth - contentWidth)/3.0
            LazyHGrid(rows: [GridItem(.flexible())], spacing: spacing) {
                ForEach(viewModel.categorys, id: \.self) { category in
                    FindCategoryCell(
                        category: category,
                        selectedCategory: $viewModel.selectedCategory
                    )
                    .onTapGesture {
                        viewModel.selectedCategory = category
                    }
                }
            }
        }
        .scrollDisabled(true)
        .frame(height: 65)
    }
    
    private var RecentSearchesTitleView: some View {
        HStack {
            Text("Recent searches")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
            Button(action: {}) {
                Text("Delete")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(.primaryHover))
            }
        }
    }
}

struct SearchFoodView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFoodView()
    }
}
