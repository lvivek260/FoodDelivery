//
//  EmailVerificationView.swift
//  FoodDelivery
//
//  Created by Neosoft on 31/10/24.
//

import SwiftUI

struct EmailVerificationView: View {
    private var viewModel = EmailVerificationViewModel()
    @State var otpTxt: [String] = Array(repeating: "", count: 4)
    
    var body: some View {
        VStack(spacing: 32) {
            titleSubTitleView
            
            VStack(spacing: 16) {
                OTPView(otpDigits: $otpTxt)
                
                dontReciveAndResendBtnView
                
                Spacer().frame(height: 28)
                
                clockView
            }
            
            NavigationButton(title: "Continue", destination: ResetPasswordView())
            
            Spacer()
        }
        .navigationTitle("OTP")
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
    
    private var dontReciveAndResendBtnView: some View {
        HStack {
            Text("Didn’t receive code?")
                .foregroundColor(Color(.neutral60))
            Button("Resend") {
                
            }
            .foregroundColor(Color(.primaryHover))
        }
        .font(.system(size: 14, weight: .medium))
    }
    
    
    private var clockView: some View {
        Label(title: {
            Text("09:00")
        }, icon: {
           Image(systemName: "clock")
        })
        .foregroundColor(Color(.neutral60))
    }
}

struct EmailVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerificationView()
    }
}
