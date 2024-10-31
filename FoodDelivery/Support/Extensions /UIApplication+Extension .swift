//
//  UIApplication+Extension .swift
//  FoodDelivery
//
//  Created by Neosoft on 30/10/24.
//

import SwiftUI

extension UIApplication {
    func changeRootViewController<Content: View>(to view: Content) {
        guard let window = connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow }) else {
            return
        }
        window.rootViewController = UIHostingController(rootView: view)
        window.makeKeyAndVisible()
    }
}
