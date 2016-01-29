//
//  main.swift
//  RandomItems
//
//  Created by Donald Steinert on 1/29/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

var items = [String]()
items.append("One")
items.append("Two")
items.append("Tree")
items.insert("Zero", atIndex: 0)

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

items.forEach() {print($0)}
