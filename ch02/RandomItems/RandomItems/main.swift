//
//  main.swift
//  RandomItems
//
//  Created by Donald Steinert on 1/29/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

//var items = [String]()
//items.append("One")
//items.append("Two")
//items.append("Tree")
//items.insert("Zero", atIndex: 0)

//print(items)
//items.removeAll()
//print(items)

//for var i = 0; i < items.count; i++ {
//    print(items[i])
//}
//
//for item in items {
//    print(item)
//}
//
//for i in 0 ..< items.count {
//    print(items[i])
//}

//items.forEach() {print($0)}
//
////var item: BNRItem? = BNRItem(name: "Item", serialNumber: "33", valueInDollars: 5, date: NSDate())
//var item: BNRItem? = BNRItem(name: "Thing", serialNumber: "4", valueInDollars: 6)
//print("\(item!.name) \(item!.serialNumber) \(item!.valueInDollars) \(item!.date)")
//
//print(item!)
//
//item = nil
//
//print(item)
//
//let itemInNameOnly = BNRItem(name: "Another")
//print(itemInNameOnly)
//
//let unknownItem = BNRItem()
//print(unknownItem)
//
//let randomItem = BNRItem.randomItem()
//print(randomItem)
//
//print(BNRItem.randomItem())
//print(BNRItem.randomItem())

var items = [BNRItem]()

for _ in 0 ..< 10 {
    items.append(BNRItem.randomItem())
}

//for item in items {
//    print(item)
//}

items.forEach { print($0) }

if let item = items.last {
    print(item)
}

// produces an error -- item out of range
//print(items[11])

let container = BNRContainer(name: "Big Nerd Container")
items.forEach { container.addItem($0) }
print(container)
