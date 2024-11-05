//
//  CustomToggleButton.swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

struct CustomToggleButton: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Button(action: {
            isOn.toggle()
        }) {
            VStack {
                if isOn {
                    Image(.agreeToggleImg)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .animation(.easeInOut(duration: 0.2), value: isOn)
                } else {
                    Image(systemName: "square")
                        .resizable()
                        .foregroundColor(Color(.neutral50))
                        .frame(width: 20, height: 20)
                        .animation(.easeInOut(duration: 0.2), value: isOn)
                }
            }
        }
    }
}

