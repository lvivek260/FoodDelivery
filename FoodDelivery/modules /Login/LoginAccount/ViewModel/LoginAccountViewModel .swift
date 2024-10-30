//
//  LoginAccountViewModel .swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import Foundation

final class LoginAccountViewModel: ObservableObject {
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    
    let title: String = "Login to your\naccount."
    let subTitle: String = "Please sign in to your account "
}
