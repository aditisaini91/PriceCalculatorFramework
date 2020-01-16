//
//  JsonReader.swift
//  PriceCalcuatorModule
//
//  Created by H231412 on 12.01.20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

public class JsonReader {
    var jsonfileName : String
    
    public init(fileName : String) {
        jsonfileName = fileName
    }
    public func getTotal() -> [Float] {
        let itemDetails : [ItemDetail] = readJsonFrom(fileName: jsonfileName)
        let totals : [Float] = calculateTotals(itemDetails: itemDetails)
        return totals
    }
    
    func readJsonFrom(fileName : String) -> [ItemDetail] {
        var itemDetails : [ItemDetail] = []
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                
                itemDetails = try JSONDecoder().decode([ItemDetail].self, from: data as Data)
                print(itemDetails)
            } catch {
                print(error)
            }
        }
        return itemDetails
    }
    
    
    func calculateTotals(itemDetails : [ItemDetail]) -> [Float] {
        var totals : [Float] = []
        
        for item in itemDetails {
            let unitPrice = item.basePrice * Float(item.units)
            let total = unitPrice - (unitPrice * Float(item.percentageDiscount)) / 100
            totals.append(total.roundTo(places: 2))
        }
        
        return totals
    }
    
}
extension Float {
    func roundTo(places: Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
