//
//  ProfileImageAndSelectionButton.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct ProfileImageAndSelectionButton: View {
    
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        ZStack {
            profileImageView
            imageSelectionButton
        }
    }
    
    private var profileImageView: some View {
        VStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(.infinity)
            } else {
                Image(.chat3)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
    }
    
    private var imageSelectionButton: some View {
        VStack {
            Spacer().frame(width: 74)
            
            HStack {
                Spacer().frame(width: 74)
                
                ImagePickerButton(selectedImage: $selectedImage) {
                    Image(systemName: "camera.fill")
                        .frame(width: 18, height: 18)
                        .tint(Color(.primaryHover))
                        .padding(8)
                        .background{
                            Circle()
                                .foregroundColor(Color(.neutral20))
                        }
                }
            }
        }
    }
}
