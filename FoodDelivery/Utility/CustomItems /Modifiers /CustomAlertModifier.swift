//
//  CustomAlertModifier.swift
//  FoodDelivery
//
//  Created by Neosoft on 12/11/24.
//

import SwiftUI

struct CustomAlertModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    let title: String
    let subTitle: String
    let firstBtnTitle: String
    var firstAction: ()->Void = {}
    let secondBtnTitle: String
    var secondAction: ()->Void = {}
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                
                CustomAlertView(
                    isPresent: $isPresented,
                    title: title,
                    subTitle: subTitle,
                    firstBtnTitle: firstBtnTitle,
                    firstAction:  {
                        firstAction()
                        isPresented = false
                    },
                    secondBtnTitle: secondBtnTitle,
                    secondAction: {
                        secondAction()
                        isPresented = false
                    }
                )
                
            }
        }
    }
   
}

