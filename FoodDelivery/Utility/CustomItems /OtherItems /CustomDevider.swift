//
//  CustomDevider.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI

struct CustomDevider: View {
    var height: CGFloat = 2
    var color: Color = Color(.neutral30)
    
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
    }
}

struct CustomDevider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDevider()
    }
}
