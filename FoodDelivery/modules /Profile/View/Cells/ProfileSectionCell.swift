//
//  ProfileSectionCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct ProfileSectionCell: View {
    let sectionData: ProfileModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text(sectionData.title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color(.neutral60))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 8) {
                ForEach(sectionData.data) { profileCell in
                    NavigationLink(destination: profileCell.navigationView) {
                        ProfileSettingCell(data: profileCell)
                    }
                }
            }
        }
    }
}
