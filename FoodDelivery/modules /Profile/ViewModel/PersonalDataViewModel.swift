//
//  PersonalDataViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import UIKit

final class PersonalDataViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    
    // MARK: - Textfields
    @Published var txtFullName: String = ""
    @Published var txtDateOfBith: String = ""
    @Published var txtGender: String = ""
    @Published var txtPhoneNumber: String = ""
    @Published var txtEmail: String = ""
}
