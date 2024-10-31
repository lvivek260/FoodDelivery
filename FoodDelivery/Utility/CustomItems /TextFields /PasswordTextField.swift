//
//  PasswordTextField.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct PasswordTextField: View {
    @State private var isSecurePassword: Bool = true
    @Binding var text: String
    let title: String
    let placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleView
            
            ZStack(alignment: .leading) {
                HStack {
                    if text.isEmpty {
                        placeHolderView
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isSecurePassword.toggle()
                    }) {
                        Image(isSecurePassword ? .eyeClose : .eyeOpen)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding()
                
                textfieldView
            }
            .frame(height: 52.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.neutral40), lineWidth: 1)
            )
        }
    }
    
    private var titleView: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
    }
    
    private var textfieldView: some View {
        VStack {
            if isSecurePassword {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .font(.system(size: 14, weight: .medium))
        .padding(.leading, 16)
        .padding(.trailing, 52)

    }
    
    private var placeHolderView: some View {
        Text(placeHolder)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color(.neutral60))
    }
}
