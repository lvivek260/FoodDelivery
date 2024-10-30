//
//  CreateAccountView .swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @ObservedObject private var viewModel = CreateAccountViewModel()
   
    var body: some View {
        
        ScrollView {
            VStack(spacing: 24) {
                titleSubTitleView
                
                VStack(spacing: 24) {
                    
                    VStack(spacing: 14) {
                        //All TextFields
                        emailTextFieldView
                        userNameTextField
                        passwordTextFieldView
                        
                        termAndPrivacyPolicy
                    }
                    
                    registerButton
                    
                    deviderWithOr
                    
                    googleFacebookAppleButtons
                }
                
                bottomTitle
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
        }
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
    
    private var emailTextFieldView: some View {
        CustomTextField(
            text: $viewModel.txtEmail,
            title: "Email Address",
            placeHolder: "Enter email"
        )
    }
    
    private var userNameTextField: some View {
        CustomTextField(
            text: $viewModel.txtEmail,
            title: "User Name",
            placeHolder: "Enter user name"
        )
    }
    
    private var passwordTextFieldView: some View {
        PasswordTextField(
            text: $viewModel.txtPassword,
            title: "Password",
            placeHolder: "Password"
        )
    }
    
    private var registerButton: some View {
        CustomButton(title: "Register") {
           
        }
    }
    
    private var termAndPrivacyPolicy: some View {
        HStack(spacing: 8) {
            VStack {
                CustomToggleButton(isOn: $viewModel.aggreePrivacyPolicy)
                Spacer()
            }
            
            let attributedText = createAttributedString()
            Text(attributedText)
                .font(.system(size: 14, weight: .medium))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
   
    
    private var deviderWithOr: some View {
        HStack(spacing: 16) {
            devider
            Text("Or sign in with")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color(.neutral60))
            devider
        }
    }
    
    private var devider: some View {
        VStack {
            Divider()
                .background(Color(.neutral60))
        }
    }
    
    private var googleFacebookAppleButtons: some View {
        HStack(spacing: 16) {
            //Google Button
            loginButton(image: .googleIcon) {
                
            }
            
            //Facebook Button
            loginButton(image: .facebookIcon) {
                
            }
            
            //Apple Button
            loginButton(image: .appleIcon) {
                
            }
        }
    }
    
    private var bottomTitle: some View {
        HStack(spacing: 2){
            Text("Don't have an account?")
                .font(.system(size: 14, weight: .medium))
            Button(action: {
                UIApplication.shared.changeRootViewController(to: LoginAccountView())
            }) {
                Text("Sign In")
                    .foregroundStyle(Color(.primaryHover))
                .font(.system(size: 14, weight: .medium))
            }
        }

    }
    
    private func createAttributedString() -> AttributedString {
        var attributedString = AttributedString("I agree with Terms of Service and Privacy Policy     ")
        
        if let rangeTerms = attributedString.range(of: "Terms of Service") {
            attributedString[rangeTerms].foregroundColor = Color(.primaryHover)
            attributedString[rangeTerms].font = Font.system(size: 14, weight: .semibold)
        }
        
        if let rangePrivacy = attributedString.range(of: "Privacy Policy") {
            attributedString[rangePrivacy].foregroundColor = Color(.primaryHover)
            attributedString[rangePrivacy].font = Font.system(size: 14, weight: .semibold)
        }

        return attributedString
    }
}

struct CreateAccountView__Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
