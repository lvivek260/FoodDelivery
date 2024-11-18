//
//  AddNewCardView.swift
//  FoodDelivery
//
//  Created by Neosoft on 13/11/24.
//

import SwiftUI

struct AddNewCardView: View {
    @ObservedObject private var viewModel = AddCardViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    nameOnCardTextField
                    cardNumberTextField
                    cardTypeTextField
                    expiryDateTextField
                    cvvTextField
                    billingAddressTextField
                }
                .padding(24)
            }
            
            Spacer()
            
            saveCardButton
        }
        .navigationTitle("Extra Card")
        .customNavigation()
    }
    
    
    private var nameOnCardTextField: some View {
        CustomTextField(
            text: $viewModel.txtNameOnCard,
            title: "Name on Card",
            placeHolder: "Enter Name"
        )
    }
    
    private var cardNumberTextField: some View {
        CustomTextField(
            text: $viewModel.txtCardNumber,
            title: "Card Number",
            placeHolder: "_ _ _ _  /  _ _ _ _  /  _ _ _ _  /  _ _ _ _"
        )
    }
    
    private var cardTypeTextField: some View {
        CustomPickerTextfield(
            title: "Card Type",
            text: $viewModel.txtCardType,
            placeHolder: "Select Card Type",
            options: ["first Card","second Card", "third card"])
    }
    
    private var expiryDateTextField: some View {
        CustomTextField(
            text: $viewModel.txtExpiryDate,
            title: "Expiry Date",
            placeHolder: "MM  /  YY"
        )
    }
    
    private var cvvTextField: some View {
        CustomTextField(
            text: $viewModel.txtCVV,
            title: "CVV",
            placeHolder: "_ _ _ _ _"
        )
    }

    private var billingAddressTextField: some View {
        CustomTextField(
            text: $viewModel.txtBillingAddress,
            title: "Billing Address",
            placeHolder: "Enter Address"
        )
    }
    
    private var saveCardButton: some View {
        CustomButton(title: "Save Card") {
            
        }
        .padding(.horizontal, 24)
    }
}

struct AddNewCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCardView()
    }
}
