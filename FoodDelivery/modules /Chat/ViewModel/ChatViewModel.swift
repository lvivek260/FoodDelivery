//
//  ChatViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 07/11/24.
//

import Foundation

final class ChatViewModel: ObservableObject {
    let chats: [ChatModel] = [
        .init(image: .chat1,
              title: "Geopart Etdsien",
              subTitle: "Your Order Just Arrived!",
              time: "11.47",
              status: .read),
        
        .init(image: .chat2,
              title: "Stevano Clirover",
              subTitle: "Your Order Just Arrived!",
              time: "13.43",
              status: .message(3)),
        
        .init(image: .chat3,
              title: "Elisia Justin",
              subTitle: "Your Order Just Arrived!",
              time: "13.67",
              status: .non),
        
        .init(image: .chat2,
              title: "Stevano Clirover",
              subTitle: "Your Order Just Arrived!",
              time: "13.43",
              status: .message(6)),
        
        .init(image: .chat3,
              title: "Elisia Justin",
              subTitle: "Your Order Just Arrived!",
              time: "11.67",
            status: .read),
        
        .init(image: .chat1,
              title: "Geopart Etdsien",
              subTitle: "Your Order Just Arrived!",
              time: "11.47",
              status: .message(8)),
        
            .init(image: .chat1,
                  title: "Geopart Etdsien",
                  subTitle: "Your Order Just Arrived!",
                  time: "9.47",
                  status: .non),
            
            .init(image: .chat2,
                  title: "Stevano Clirover",
                  subTitle: "Your Order Just Arrived!",
                  time: "14.43",
                  status: .message(3)),
            
            .init(image: .chat3,
                  title: "Elisia Justin",
                  subTitle: "Your Order Just Arrived!",
                  time: "16.67",
                  status: .read),
            
            .init(image: .chat2,
                  title: "Stevano Clirover",
                  subTitle: "Your Order Just Arrived!",
                  time: "17.43",
                  status: .message(2)),
            
            .init(image: .chat3,
                  title: "Elisia Justin",
                  subTitle: "Your Order Just Arrived!",
                  time: "10.67",
                status: .read),
            
            .init(image: .chat1,
                  title: "Geopart Etdsien",
                  subTitle: "Your Order Just Arrived!",
                  time: "21.47",
                  status: .message(7)),
    ]
}
