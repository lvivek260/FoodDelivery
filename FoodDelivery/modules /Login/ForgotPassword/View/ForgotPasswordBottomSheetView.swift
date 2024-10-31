//
//  ForgotPasswordDropDownView.swift
//  FoodDelivery
//
//  Created by Neosoft on 31/10/24.
//

import SwiftUI

struct ForgotPasswordBottomSheetView: View {
    
    @ObservedObject private var viewModel = ForgotPasswordViewModel()
    var navigateToForgotView: ()->Void
    var selfDismiss: ()->Void
    
    var body: some View {
            VStack(spacing: 24) {
                titleSubTitleView
                
                gridView
                
                continueButton
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 20)
    }
    
    private var titleSubTitleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.title)
                .font(.system(size: 24, weight: .semibold))
            
            Text(viewModel.selectOptionSubtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color(.neutral60))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var gridView: some View {
        VStack(spacing: 16) {
            ForEach(viewModel.forgotPasswordOptions, id: \.self) { option in
                ForgotPasswordGridCell(
                    isSelected:
                        Binding(
                        get: { viewModel.selectedOption == option },
                        set: { isSelected in
                            if isSelected {
                                viewModel.selectedOption = option
                            }
                        }
                    ),
                    image: option.image,
                    title: option.title,
                    subTitle: option.subTitle
                )
                .onTapGesture {
                    viewModel.selectedOption = option
                }
            }
        }
    }
    
    private var continueButton: some View {
        CustomButton(title: "Continue") {
            selfDismiss()
            navigateToForgotView()
        }
    }
}


fileprivate struct ForgotPasswordGridCell: View {
    @Binding var isSelected: Bool
    let image: ImageConstants
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack(spacing: 16) {
            leftSideImageView
            
            titleSubTitleView
            
            Spacer()
            
            if isSelected {
                rightSideImageView
            }
        }
        .padding(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(isSelected ? .primaryHover : .neutral40), lineWidth: 1)
        }
        
    }
    
    private var leftSideImageView: some View {
        Image(image)
            .resizable()
            .frame(width: 44, height: 44)
    }
    
    private var titleSubTitleView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color(.neutral60))
            Text(subTitle)
                .font(.system(size: 14, weight: .medium))
        }
    }
    
    private var rightSideImageView: some View {
        Image(.selectionIcon)
            .resizable()
            .frame(width: 24, height: 24)
    }
}

struct ForgotPasswordDropDownView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordBottomSheetView(navigateToForgotView: {}, selfDismiss: {})
    }
}
