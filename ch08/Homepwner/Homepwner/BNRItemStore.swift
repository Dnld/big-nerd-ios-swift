//
//  BNRItemStore.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/2/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRItemStore: NSObject {
    // singelton with inaccessible initializer
    static let sharedStore = BNRItemStore()
    private override init() { super.init() }
    
    private var privateItems = [BNRItem]()
    var allItems: [BNRItem] {
        return privateItems.map { $0 }
    }
    
    func createItem() -> BNRItem {
        let item = BNRItem.randomItem()
        privateItems.append(item)
        return item
    }
    
}
