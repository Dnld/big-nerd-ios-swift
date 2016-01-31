//
//  BNRContainer.swift
//  RandomItems
//
//  Created by Donald Steinert on 1/31/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class BNRContainer: BNRItem {
    private var subitems: [BNRItem?]
    
    override var description: String {
        var totalValue = valueInDollars
        for item in subitems {
            totalValue += item!.valueInDollars
        }
        return "Container \(name) is worth $\(totalValue)"
    }
    
    init(name: String) {
        subitems = [BNRItem]()
        super.init(name: name, serialNumber: "N/A", valueInDollars: 0)
    }
    
    func addItem(item: BNRItem) {
        subitems.append(item)
        item.container = self
    }
    
    func removeItem(index: Int) {
        subitems.removeAtIndex(index)
    }
    
    func getItemAtIndex(index: Int) -> BNRItem {
        return subitems[index]!
    }
    
}
