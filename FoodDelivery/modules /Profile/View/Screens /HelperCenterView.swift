//
//  HelperCenterView.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct HelperCenterView: View {
    private let viewModel = HelpCenterViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                titleView
                gridView
            }
            .padding(16)
        }
        .background(Color(.neutral20))
        .navigationTitle("Help Center")
        .customNavigation()
    }
    
    private var titleView: some View {
        Text("Hi, how we can help you?")
            .font(.system(size: 16, weight: .semibold))
    }
    
//    private var searchView: some View {
//
//    }
    
    private var gridView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.data, id: \.self) { helpCenter in
                HelperCenterCell(helpCenter: helpCenter)
            }
        }
    }
}


fileprivate struct HelperCenterCell: View {
    let helpCenter: HelpCenterModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            imageView
            
            VStack(alignment: .leading, spacing: 8) {
                titleView
                subTitleView
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .background(Color(.neutral10))
        .cornerRadius(12)
    }
    
    private var imageView: some View {
        Image(helpCenter.image)
    }
    
    private var titleView: some View {
        Text(helpCenter.title)
            .font(.system(size: 16, weight: .semibold))
    }
    
    private var subTitleView: some View {
        Text(helpCenter.subTitle)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(Color(.neutral60))
    }
}



struct HelperCenterView_Previews: PreviewProvider {
    static var previews: some View {
        HelperCenterView()
    }
}
