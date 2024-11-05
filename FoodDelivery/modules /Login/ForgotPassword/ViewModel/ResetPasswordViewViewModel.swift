//
//  ResetPasswordViewViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import Foundation

final class ResetPasswordViewModel: ObservableObject {
    let title: String = "Reset Password"
    let subTitle: String = "Your new password must be different from the previously used password"
    
    @Published var txtNewPassword: String = ""
    @Published var txtConfirmPassword: String = ""
}
