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
    let firstAction: ()->Void
    let secondBtnTitle: String
    let secondAction: ()->Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                
                CustomAlertView(
                    title: title,
                    subTitle: subTitle,
                    firstBtnTitle: firstBtnTitle,
                    firstAction:  {
                        firstAction()
                    },
                    secondBtnTitle: secondBtnTitle,
                    secondAction: {
                        secondAction()
                    }
                )
                
            }
        }
    }
   
}

