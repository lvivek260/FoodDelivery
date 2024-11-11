//
//  HelpCenterViewModel.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import Foundation

final class HelpCenterViewModel {
    let data: [HelpCenterModel] = [
        .init(image: .helpCenter1,
              title: "General",
              subTitle: "Basic question about Restate"),
        .init(image: .helpCenter2,
                  title: "Sellers",
                  subTitle: "All you need to know about selling your home to Restate"),
        .init(image: .helpCenter3,
                  title: "Buyers",
                  subTitle: "Everything you need to know about buying with Restate "),
        .init(image: .helpCenter4,
                  title: "Agents",
                  subTitle: "How buying agents and listing agents can work with Restate")
    ]
}
