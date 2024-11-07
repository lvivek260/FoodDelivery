//
//  ChatListView.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import SwiftUI

struct ChatListView: View {
    
    @ObservedObject private var viewModel = ChatViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    allMessageTitle
                    chatGridView
                }
                .padding(.horizontal, 24)
            }
            .background(Color(.neutral20))
            .navigationTitle("Chat List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var allMessageTitle: some View {
        Text("All Message")
            .font(.system(size: 15, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chatGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible())], spacing: 12) {
            ForEach(viewModel.chats, id: \.self) { chat in
                ChatCell(chat: chat)
            }
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
