//
//  LoginAccountView .swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct LoginAccountView: View {
    
    @ObservedObject private var viewModel = LoginAccountViewModel()
    @State var toToForgotPasswordView: Bool = false
   
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    titleSubTitleView
            
                    VStack(spacing: 24) {
                        //Text Fields
                        VStack(spacing: 14) {
                            emailTextFieldView
                            passwordTextFieldView
                        }
                        
                        forgotPasswordButton
                        
                        signInButton
                        
                        deviderWithOr
                        
                        googleFacebookAppleButtons
                    }
                    
                    bottomTitle
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 32)
            }
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
    
    private var passwordTextFieldView: some View {
        PasswordTextField(
            text: $viewModel.txtPassword,
            title: "Password",
            placeHolder: "Password"
        )
    }
    
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            
            NavigationLink(
                destination: ForgotPasswordView(),
                isActive: $toToForgotPasswordView ) {
                    Text("")
                }
            
            Button(action: {
                viewModel.showForgotPaasswordBottomSheet = true
            }) {
                Text("Forgot password?")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(.primaryHover))
            }
            .sheet(isPresented: $viewModel.showForgotPaasswordBottomSheet) {
                ForgotPasswordBottomSheetView(
                    navigateToForgotView: {
                          toToForgotPasswordView = true
                    },
                    selfDismiss: {
                        viewModel.showForgotPaasswordBottomSheet = false
                    }
                )
                  .presentationDetents([.medium, .large])
            }
        }
    }
    
    private var signInButton: some View {
        CustomButton(title: "Sign in") {
            UIApplication.shared.changeRootViewController(to: MyTabBarView())
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
                UIApplication.shared.changeRootViewController(to: CreateAccountView())
            }) {
                Text("Register")
                    .foregroundStyle(Color(.primaryHover))
                .font(.system(size: 14, weight: .medium))
            }
        }

    }
}


 struct loginButton: View {
    let image: ImageConstants
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}


struct LoginAccountView__Previews: PreviewProvider {
    static var previews: some View {
        LoginAccountView()
    }
}
