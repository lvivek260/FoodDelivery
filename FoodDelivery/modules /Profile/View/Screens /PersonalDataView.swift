//
//  PersonalDataView.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct PersonalDataView: View {
    @State var selectedImage: UIImage?
    
    // MARK: - Textfields
    @State var txtFullName: String = ""
    @State var txtDateOfBith: String = ""
    @State var txtGender: String = ""
    @State var txtPhoneNumber: String = ""
    @State var txtEmail: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProfileImageAndSelectionButton(selectedImage: $selectedImage)
                allTextFields
                saveButtonView
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        }
        .navigationTitle("Personal Data")
        .customNavigation()
    }
    
    private var allTextFields: some View {
        VStack(spacing: 12) {
            fullNameTextFieldView
            dateOfBirthTextFieldView
            genderTextFieldView
            phoneTextFieldView
            emailTextFieldView
        }
    }
    
    private var fullNameTextFieldView: some View {
        CustomTextField(
            text: $txtFullName,
            title: "Full Name",
            placeHolder: "Enter name"
        )
    }
    
    private var dateOfBirthTextFieldView: some View {
        CustomDatePickerTextField(
            title: "Date of birth",
            text: $txtDateOfBith,
            placeholder: "Enter date of birth"
        )
    }
    
    private var genderTextFieldView: some View {
       CustomPickerTextfield(
           title: "Gender",
           text: $txtGender,
           placeHolder: "Select gender",
           options: ["Male", "Female", "Others"]
       )
    }
    
    private var phoneTextFieldView: some View {
        CustomTextField(
            text: $txtPhoneNumber,
            title: "Phone",
            placeHolder: "Enter phone"
        )
        .keyboardType(.numberPad)
    }
    
    private var emailTextFieldView: some View {
        CustomTextField(
            text: $txtEmail,
            title: "Email",
            placeHolder: "Enter email"
        )
        .keyboardType(.emailAddress)
    }
    
    private var saveButtonView: some View {
        CustomButton(title: "Save") {
            
        }
    }
}

struct PersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataView()
    }
}


