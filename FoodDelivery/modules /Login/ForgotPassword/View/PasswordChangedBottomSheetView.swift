//
//  PasswordChangedBottomSheetView.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import SwiftUI

struct PasswordChangedBottomSheetView: View {
    var body: some View {
        
        VStack(spacing: 32) {
            Image(.passwordChangeSuccess)
                .resizable()
                .frame(width: 202.0, height: 168.0)
            
            titleSubTitleView
            
            verifyAccountBtn
            
            Spacer()
        }
        .padding([.all], 32)
    }
    
    private var titleSubTitleView: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Password Changed")
                .font(.system(size: 32, weight: .semibold))
            Text("Password changed successfully, you can login again with a new password")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color(.neutral60))
                .multilineTextAlignment(.center)
        }
    }
    
    private var verifyAccountBtn: some View {
        CustomButton(title: "Verify Account") {
            UIApplication.shared.changeRootViewController(to: LoginAccountView())
        }
    }
}

struct PasswordChangedBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordChangedBottomSheetView()
    }
}
