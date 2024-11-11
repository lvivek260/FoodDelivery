//
//  PersonalDataView.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct PersonalDataView: View {
    
    @ObservedObject private var viewModel = PersonalDataViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProfileImageAndSelectionButton(selectedImage: $viewModel.selectedImage)
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
            text: $viewModel.txtFullName,
            title: "Full Name",
            placeHolder: "Enter name"
        )
    }
    
    private var dateOfBirthTextFieldView: some View {
        CustomDatePickerTextField(
            title: "Date of birth",
            text: $viewModel.txtDateOfBith,
            placeholder: "Enter date of birth"
        )
    }
    
    private var genderTextFieldView: some View {
       CustomPickerTextfield(
           title: "Gender",
           text: $viewModel.txtGender,
           placeHolder: "Select gender",
           options: ["Male", "Female", "Others"]
       )
    }
    
    private var phoneTextFieldView: some View {
        CustomTextField(
            text: $viewModel.txtPhoneNumber,
            title: "Phone",
            placeHolder: "Enter phone"
        )
        .keyboardType(.numberPad)
    }
    
    private var emailTextFieldView: some View {
        CustomTextField(
            text: $viewModel.txtEmail,
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


