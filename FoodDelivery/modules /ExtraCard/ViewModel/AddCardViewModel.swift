//
//  AddCardViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 13/11/24.
//

import Foundation

final class AddCardViewModel: ObservableObject {
    @Published var txtNameOnCard: String = ""
    @Published var txtCardNumber: String = ""
    @Published var txtCardType: String = ""
    @Published var txtExpiryDate: String = ""
    @Published var txtCVV: String = ""
    @Published var txtBillingAddress: String = ""
}
