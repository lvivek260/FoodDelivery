//
//  OtpView.swift
//  FoodDelivery
//
//  Created by Neosoft on 05/11/24.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpDigits: [String]
    @FocusState private var focusedField: Int?

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<4, id: \.self) { index in
                TextField("", text: $otpDigits[index])
                    .frame(width: 50, height: 50)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: index)
                    .onChange(of: otpDigits[index]) { newValue in
                        // Limit input to one digit
                        if newValue.count > 1 {
                            otpDigits[index] = String(newValue.prefix(1))
                        }
                        // Move to next field if a digit is entered
                        if !newValue.isEmpty && index < 3 {
                            focusedField = index + 1
                        }
                        // Move back to previous field if cleared
                        if newValue.isEmpty && index > 0 {
                            focusedField = index - 1
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
        .onAppear {
            focusedField = 0 // Focus the first field on appear
        }
    }
}

