//
//  SwiftUIView.swift
//  FoodDelivery
//
//  Created by Neosoft on 29/10/24.
//

import SwiftUI

struct OnboaringView: View {
    
    @ObservedObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                Spacer()
                
                contentCardView
                    .background {
                        RoundedRectangle(cornerRadius: 48)
                            .fill(Color(.primaryHover))
                    }
                    .padding([.leading, .trailing, .bottom], 30)
            }
        }
        
    }
    
    private var contentCardView: some View {
        VStack {
            VStack(spacing: 16) {
                titleText
                
                subTitleText
                
                CustomPager(
                    totalIndex: viewModel.totalIndex,
                    currentIndex: $viewModel.currentIndex
                )
            }
            let spaceHeight = viewModel.currentIndex<viewModel.totalIndex-1 ? 100.0 : 24.0
            Spacer().frame(height: spaceHeight)
            
            if viewModel.currentIndex == viewModel.totalIndex-1 {
                goToLoginButton
            } else {
                HStack {
                    skipButton
                    Spacer()
                    nextButton
                }
                .font(.system(size: 14, weight: .semibold))
                .tint(Color(.neutral10))
            }
           
        }
        .padding(32)
    }
    
    private var titleText: some View {
        Text(viewModel.title)
            .font(.system(size: 32, weight: .semibold))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color(.neutral10))
    }
    
    private var subTitleText: some View {
        Text(viewModel.subTitle)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(Color(.neutral10))
            .multilineTextAlignment(.center)
    }
    
    private var skipButton: some View {
        Button("Skip") {
           
        }
    }
    
    private var nextButton: some View {
        Button(action: {
            viewModel.currentIndex += 1
        }, label: {
            HStack(spacing: 16) {
                Text("Next")
                Image(.rightArrow)
            }
        })
    }
    
    private var goToLoginButton: some View {
        Button(action: {

        }, label: {
            Image(.progressButton)
                .resizable()
                .frame(width: 94, height: 94)
        })
    }
    
    private var background: some View {
        Image(viewModel.backgroundImage)
            .resizable()
            .ignoresSafeArea(.all)
            .scaledToFill()
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        OnboaringView()
    }
}
