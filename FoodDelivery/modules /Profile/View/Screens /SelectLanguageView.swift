//
//  SelectLanguageView.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct SelectLanguageView: View {
    @ObservedObject private var viewModel = SettingDataViewModel()
    var afterSelection: ((_ language: LanguageModel) -> Void)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                titleView
                languagesGridView
                selectButtonView
            }
            .padding( 24)
        }
    }
    
    private var titleView: some View {
        Text("Select Language")
            .font(.system(size: 16, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var languagesGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.languages, id: \.self) { language in
                
                Button(action: {
                    viewModel.selectedLanguage = language
                }) {
                    SelectLanguageCell(
                        languageModel: language,
                        selectedLanguage: $viewModel.selectedLanguage
                    )
                }
            }
        }
    }
    
    private var selectButtonView: some View {
        CustomButton(title: "Select") {
            afterSelection(viewModel.selectedLanguage)
        }
    }
}

