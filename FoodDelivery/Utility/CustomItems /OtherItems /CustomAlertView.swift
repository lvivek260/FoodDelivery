//
//  CustomAlertView.swift
//  FoodDelivery
//
//  Created by Neosoft on 12/11/24.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var isPresent: Bool
    let title: String
    let subTitle: String 
    let firstBtnTitle: String
    let firstAction: ()->Void
    let secondBtnTitle: String
    let secondAction: ()->Void
    
    var body: some View {
        VStack(spacing: 24) {
            HStack(spacing: 4) {
                emptyView
                Spacer()
                titleView
                Spacer()
                cancelButton
            }
            
            subTitleView
            
            HStack(spacing: 16) {
                firstButton
                secondButton
            }
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.neutral10))
        }
        .padding(24)
    }
    
    private var emptyView: some View {
        Rectangle()
            .fill(.clear)
            .frame(width: 36, height: 36)
    }
    
    private var titleView: some View {
        Text(title)
            .multilineTextAlignment(.center)
            .font(.system(size: 24, weight: .semibold))
    }
    
    private var subTitleView: some View {
        Text(subTitle)
            .multilineTextAlignment(.center)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color(.neutral60))
    }
    
    private var firstButton: some View {
        Button(action: firstAction) {
            Text(firstBtnTitle)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 14)
                .overlay {
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color(.neutral40))
                }
        }
    }
    
    private var secondButton: some View {
        Button(action: secondAction) {
            Text(secondBtnTitle)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 14)
                .background(Color(.primaryHover))
                .cornerRadius(.infinity)
        }
    }
    
    private var cancelButton: some View {
       Button(action: {
           isPresent = false
       }) {
           Image(.cardIcon)
               .resizable()
               .frame(width: 36, height: 36)
       }
    }
}

