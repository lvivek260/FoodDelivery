//
//  ResetPasswordView.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import SwiftUI

struct ResetPasswordView: View {
    
   @ObservedObject private var viewModel = ResetPasswordViewModel()
    @State var passwordResetSucess: Bool = false
    
    var body: some View {
        
        VStack(spacing: 32) {
            titleSubTitleView
            
            VStack(spacing: 16) {
                newPasswordView
                
                confirmPasswordView
            }
            
            Spacer()
        
            verifyAccountBtn
        }
        .navigationTitle("Reset Password")
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
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
    
    private var newPasswordView: some View {
        VStack(spacing: 8) {
            PasswordTextField(
                text: $viewModel.txtNewPassword,
                title: "New Password",
                placeHolder: ""
            )
            
            Text("Must be at least 8 character")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(.neutral60))
        }
    }
    
    private var confirmPasswordView: some View {
        VStack(spacing: 8) {
            PasswordTextField(
                text: $viewModel.txtNewPassword,
                title: "Confirm Password",
                placeHolder: ""
            )
            
            Text("Both password must match")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(.neutral60))
        }
    }
    
    private var verifyAccountBtn: some View {
        CustomButton(title: "Verify Account") {
            passwordResetSucess.toggle()
        }
        .sheet(isPresented: $passwordResetSucess) {
            PasswordChangedBottomSheetView()
                .presentationDetents([.medium, .large])
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
