//
//  BNRItemsViewController.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/2/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRItemsViewController: UITableViewController {

    init() {
        super.init(style: UITableViewStyle.Plain)
        for _ in 0 ..< 5 {
            BNRItemStore.sharedStore.createItem()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BNRItemStore.sharedStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
        let item = BNRItemStore.sharedStore.allItems[indexPath.row]
        cell.textLabel?.text = item.description
        return cell
    }
    
}
