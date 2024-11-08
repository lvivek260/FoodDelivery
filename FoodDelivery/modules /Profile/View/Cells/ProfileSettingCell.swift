//
//  ProfileSettingCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct ProfileSettingCell: View {

    let data: ProfileCellModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(data.image)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(data.title)
                .foregroundColor(Color(.neutral100))
                .font(.system(size: 14, weight: .medium))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .tint(Color(.neutral100))
        }
        .padding(.vertical, 8)
    }
}
