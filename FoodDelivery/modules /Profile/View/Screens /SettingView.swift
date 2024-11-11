//
//  SettingView.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct SettingView: View {
   @ObservedObject private var viewModel = SettingDataViewModel()
   @State private var isPresentedSelectLanguage: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                profileView
                othersViews
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
        .navigationTitle("Settings")
        .customNavigation()
    }
    
// MARK: - Profile Views
    private var profileView: some View {
        VStack(spacing: 18) {
            profileTitle
            pushNotification
            locationOnView
            languageChangeView
        }
        .font(.system(size: 14, weight: .medium))
    }
    
    private var profileTitle: some View {
        Text("PROFILE")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Color(.neutral60))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var pushNotification: some View {
        Toggle(isOn: $viewModel.isOnPushNotification) {
            Text("Push Notification")
        }
        .tint(Color(.primaryHover))
    }
    
    private var locationOnView: some View {
        Toggle(isOn: $viewModel.isOnLocation) {
            Text("Location")
        }
        .tint(Color(.primaryHover))
    }
    
    private var languageChangeView: some View {
        HStack {
            Text("Language")
            
            Spacer()
            
            Button(action: {
                isPresentedSelectLanguage = true
            }) {
                HStack(spacing: 16) {
                    Text(viewModel.selectedLanguage.name)
                    Image(systemName: "chevron.right")
                }
            }
            .tint(.black)
        }
        .sheet(isPresented: $isPresentedSelectLanguage) {
            SelectLanguageView { selectedLanguage in
                viewModel.selectedLanguage = selectedLanguage
                isPresentedSelectLanguage = false
            }
            .presentationDetents([.height(480), .large])
            .presentationDragIndicator(.visible)
        }
    }
    
// MARK: - Others Views
    var othersViews: some View {
        VStack(spacing: 28) {
            otherViewTitle
            SettingCell(text: "About Ticketis")
            SettingCell(text: "Privacy Policy")
            SettingCell(text: "Terms and Conditions")
        }
    }
    
    private var otherViewTitle: some View {
        Text("OTHER")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Color(.neutral60))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct SettingCell: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 14, weight: .medium))
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}
