//
//  ForgotPasswordViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 31/10/24.
//

import Foundation

final class ForgotPasswordViewModel: ObservableObject {
    @Published var txtEmail: String = ""
    @Published var selectedOption: ForgotPasswordModel?
    
    let title: String = "Forgot password?"
    let subTitle: String = "Enter your email address and we’ll send you confirmation code to reset your password"
    let selectOptionSubtitle = "Select which contact details should we use to reset your password"
    
    let forgotPasswordOptions: [ForgotPasswordModel] = [
        .init(image: .whatsAppIcon, title: "Send via WhatsApp", subTitle: "+12 8347 2838 28"),
        .init(image: .emailIcon, title: "Send via Email", subTitle: "Albertstevano@gmail.com")
    ]
    
    
}
