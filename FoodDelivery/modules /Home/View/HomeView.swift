//
//  HomeView.swift
//  FoodDelivery
//
//  Created by Neosoft on 06/11/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
// MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    headerCardView
                    
                    VStack(spacing: 16) {
                        findByCategoryView
                        
                        contentGridView
                    }
                    
                    Spacer()
                }
            }
            .background(Color(.neutral20))
            .edgesIgnoringSafeArea(.top)
        }
    }
    
// MARK: - Header Card Views
    private var headerCardView: some View {
        ZStack {
            headerCardBackground
            
            VStack(spacing: 24) {
                HStack {
                    locationView
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        notificationButton
                        searchButton
                    }
                }
                
                Text("Provide the best\nfood for you")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
            .padding(.horizontal, 24)
        }
    }
    
    private var headerCardBackground: some View {
        Image(.homeHeaderBg)
            .resizable()
            .frame(height: 230)
    }
    
    private var locationView: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text("Your Location")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 8) {
                Image(.locationIcon)
                    .foregroundColor(.white)
                Text("New York City")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
    }
    
    private var notificationButton: some View {
        NavigationLink(destination: OnboardingView()) {
            Image(.notificationIcon)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
        }
    }
    
    private var searchButton: some View {
        NavigationLink(destination: OnboardingView()) {
            Image(.searchIcon)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
        }
    }
    
// MARK: - Find By Category Views
    private var findByCategoryView: some View {
        VStack(spacing: 16){
            findByCategoryTitleView
            categoryGridView
        }
        .padding(.horizontal, 24)
        .onAppear {
            viewModel.selectedCategory = viewModel.categorys.first
        }
    }
    
    private var findByCategoryTitleView: some View {
        HStack {
            Text("Find by Category")
                .font(.system(size: 16, weight: .semibold))
            Spacer()
            Button(action: {}) {
                Text("See All")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(.primaryHover))
            }
        }
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
    
// MARK: - Content Depend on Category
    private var contentGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 22), GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.categoryContent, id: \.self) { content in
                CategoryContentCell(content: content)
            }
        }
        .padding(.horizontal, 24)
    }
}



// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
