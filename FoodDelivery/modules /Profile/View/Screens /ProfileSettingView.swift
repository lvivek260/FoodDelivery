//
//  ProfileSettingView.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct ProfileSettingView: View {
    private let viewModel = ProfileSettingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                headerProfileView
                
                VStack(spacing: 24) {
                    myOrderDetailView
                    
                    CustomDevider(color: Color(.neutral40).opacity(0.5))
                    
                    cellGridView
                    
                    signOutButton
                }
            }
            .padding(24)
        }
        .background(Color(.neutral20))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Profile Settings")
    }
    
// MARK: - Header Profile View
    private var headerProfileView: some View {
        VStack(spacing: 16) {
            profileImageView
            nameEmailView
        }
    }
    
    private var profileImageView: some View {
        Image(.chat3)
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    private var nameEmailView: some View {
        VStack(spacing: 4) {
            Text("Albert Stevano Bajefski")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(.neutral100))
            Text("Albertstevano@gmail.com")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.neutral60))
                .tint(Color(.neutral60))
        }
    }
    
// MARK: - My Ordeer Detail Views
    private var myOrderDetailView: some View {
        VStack(spacing: 16) {
            myOrderTitleSellButton
            
            VStack(spacing: 12) {
                HStack {
                   orderIdText
                   Spacer()
                   inDeliveryButton
                }
                
                Divider()
                
                productPriceTitleImageView
            }
        }
        .padding(8)
        .background(
            Color(.neutral10)
                .cornerRadius(8)
        )
        .shadow(color: Color(.neutral30), radius: 20)
    }
    
    private var myOrderTitleSellButton: some View {
        HStack {
            Text("My Orders")
                .font(.system(size: 16, weight: .semibold))
            
            Spacer()
            
            Button(action: {}) {
                Text("See All")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.primaryHover))
            }
        }
    }
    
    private var orderIdText: some View {
        HStack(spacing: 4) {
            Text("Order ID")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color(.neutral60))
            
            Text("888333777")
                .font(.system(size: 12, weight: .semibold))
        }
    }
    
    private var inDeliveryButton: some View {
        Button(action: {}) {
            Text("In Delivery")
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(Color(.neutral10))
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .background{
                    Color(.primaryHover)
                        .cornerRadius(.infinity)
                }
        }
    }
    
    private var productPriceTitleImageView: some View {
        HStack(spacing: 14) {
            Image(.burger)
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Burger With Meat")
                    .font(.system(size: 14, weight: .semibold))
                Text("$ 12,230")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(.primaryHover))
            }
            
            Spacer()
            
            Text("14 items")
                .font(.system(size: 12, weight: .medium))
        }
    }
    
    // MARK: - Cell Grid View
    var cellGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.cellData) { section in
                ProfileSectionCell(sectionData: section)
            }
        }
    }
    
    var signOutButton: some View {
        Button(action: {}, label: {
            HStack(spacing: 8) {
                Image(.signOut)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("Sign Out")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .overlay {
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(Color(.neutral40), lineWidth: 1)
            }
        })
    }
}

struct ProfileSettingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingView()
    }
}



