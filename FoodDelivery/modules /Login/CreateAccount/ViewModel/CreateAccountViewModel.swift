//
//  CreateAccountViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import Foundation


final class CreateAccountViewModel: ObservableObject {
    @Published var aggreePrivacyPolicy: Bool = false
    @Published var txtEmail: String = ""
    @Published var txtUserName: String = ""
    @Published var txtPassword: String = ""
    
    let title: String = "Create your new\naccount"
    let subTitle: String = "Create an account to start looking for the food you like"
}
