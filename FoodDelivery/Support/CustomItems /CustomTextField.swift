//
//  CustomTextField.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleView
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    placeHolderView
                }
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
        TextField("", text: $text)
            .font(.system(size: 14, weight: .medium))
            .padding([.leading, .trailing], 20)
    }
    
    private var placeHolderView: some View {
        Text(placeHolder)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color(.neutral60))
            .padding([.leading, .trailing], 20)
    }
}
