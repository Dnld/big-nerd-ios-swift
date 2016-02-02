//
//  BNRItem.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/2/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRItem: NSObject {

    var name: String
    var serialNumber: String
    var valueInDollars: Int
    let date: NSDate
    
    override var description: String {
        return "Item: \(name), with serial number: \(serialNumber), is worth $\(valueInDollars) and was created on \(date)"
    }
    
    init(name: String, serialNumber: String, valueInDollars: Int) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        date = NSDate()
    }
    
    convenience init(name: String) {
        self.init(name: name, serialNumber: "N/A", valueInDollars: 0)
    }
    
    convenience override init() {
        self.init(name: "N/A")
    }
    
    class func randomItem() -> BNRItem {
        let randomAdjectivesList = ["Fluffy", "Rusty", "Shiny"]
        let randomNounsList = ["Bear", "Spork", "Mac"]
        
        let adjectiveIndex = Int(arc4random()) % randomAdjectivesList.count
        let nounIndex = Int(arc4random()) % randomNounsList.count
        
        let randomName = "\(randomAdjectivesList[adjectiveIndex]) \(randomNounsList[nounIndex])"
        let randomSerialNumber = String(Int(arc4random() % 10000))
        let randomValue = Int(arc4random() % 100)
        
        let newItem = BNRItem(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        
        return newItem
    }
    
    deinit {
        print("Destroyed \(self)")
    }
    
}
