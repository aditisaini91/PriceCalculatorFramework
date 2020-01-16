//
//  ItemDetails.swift
//  PriceCalculator
//
//  Created by H231412 on 09.01.20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation

struct ItemDetail : Codable {
    var basePrice : Float
    var itemDescription : String
    var units : Int
    var itemId : String
    var percentageDiscount : Float
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        basePrice = try values.decodeIfPresent(Float.self, forKey: .basePrice) ?? 0
        itemDescription = try values.decode(String.self, forKey: .itemDescription)
        units = try values.decodeIfPresent(Int.self, forKey: .units) ?? 0
        itemId = try values.decode(String.self, forKey: .itemId)
        percentageDiscount = try values.decodeIfPresent(Float.self, forKey: .percentageDiscount) ?? 0

    }
}
