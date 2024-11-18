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
                VStack(spacing: 16) {
                    recentSearchesTitleView
                    recentSearchesView
                }
                Divider()
                myRecentOrders
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
        .background(Color(.neutral20))
        .navigationTitle("Search Food")
        .customNavigation()
    }
    
    private var searchTextFeild: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color(.neutral50))
                
            TextField("Search Food", text: $viewModel.txtSearch)
        }
        .padding(16)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.neutral50))
        }
    }
    
    private var categoryGridView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            let deviceWidth = UIScreen.main.bounds.width
            let contentWidth = (24.0*2) + (60.0*4)  // 24*2 padding(leading, trailing), 60*4 cell width
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
    
    private var recentSearchesTitleView: some View {
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
    
    private var recentSearchesView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.recentSearches, id: \.self) { searchTitle in
                RecentSearchesView(title: searchTitle)
            }
        }
    }
    
    private var myRecentOrders: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("My recent orders")
                .font(.system(size: 16, weight: .semibold))
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.recentOrders, id: \.self) { recentOrder in
                    MyRecentOrdersCell(order: recentOrder)
                }
            }
        }
    }
}


struct SearchFoodView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFoodView()
    }
}
