//
//  ForgotPasswordView.swift
//  FoodDelivery
//
//  Created by Neosoft on 31/10/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject private var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            titleSubTitleView
            
            emailTextfield
            
            Spacer().frame(height: 120)
            
            continueButton
            
            Spacer()
        }
        .customNavigation()
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
    }
    
    private var titleSubTitleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.title)
                .font(.system(size: 32, weight: .semibold))
            Text(viewModel.subTitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color(.neutral60))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var emailTextfield: some View {
        CustomTextField(
            text: $viewModel.txtEmail,
            title: "Email Address",
            placeHolder: "Enter Email"
        )
    }
    
    private var continueButton: some View {
        NavigationButton(title: "Continue", destination: EmailVerificationView())
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
