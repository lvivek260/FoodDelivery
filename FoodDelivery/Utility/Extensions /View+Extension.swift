//
//  View+Extension.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

extension View {
    func customNavigation() -> some View {
        self.modifier(CustomNavigationModifier())
    }
    
    func customAlert(isPresented: Binding<Bool>,
                     title: String,
                     message: String,
                     firstBtnTitle: String,
                     firstAction: @escaping ()->Void,
                     secondBtnTitle: String,
                     secondAction: @escaping ()->Void
    ) -> some View {
        self.modifier(
            CustomAlertModifier(
                isPresented: isPresented,
                title: title,
                subTitle: message,
                firstBtnTitle: firstBtnTitle,
                firstAction: firstAction,
                secondBtnTitle: secondBtnTitle,
                secondAction: secondAction
            )
        )
    }
}
