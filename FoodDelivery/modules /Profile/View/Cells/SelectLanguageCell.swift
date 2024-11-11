//
//  SelectLanguageCell.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct SelectLanguageCell: View {
    let languageModel: LanguageModel
    @Binding var selectedLanguage: LanguageModel
    
    private var isSelected: Bool {
        return languageModel.name == selectedLanguage.name
    }
    
    var body: some View {
        HStack(spacing: 12) {
            flagText
            languageName
            Spacer()
            isSelectionImage
        }
        .tint(.black)
        .padding(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(isSelected ? .primaryHover : .neutral30))
        }
    }
    
    private var flagText: some View {
        Text(languageModel.flag)
            .font(.system(size: 14, weight: .bold))
            .frame(width: 24, height: 24)
            .padding(6)
            .background {
                Circle()
                    .fill(Color(.neutral20))
            }
    }
    
    private var languageName: some View {
        Text(languageModel.name)
            .font(.system(size: 14, weight: .semibold))
    }
    
    private var isSelectionImage: some View {
        VStack {
            if isSelected {
                Image(.selectionIcon)
            }
        }
    }
}
