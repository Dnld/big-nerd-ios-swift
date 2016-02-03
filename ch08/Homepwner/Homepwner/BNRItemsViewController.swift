//
//  BNRItemsViewController.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/2/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRItemsViewController: UITableViewController {
    
    @IBOutlet var headerView: UIView?
    
    init() {
        super.init(style: UITableViewStyle.Plain)
        for _ in 0 ..< 5 {
            BNRItemStore.sharedStore.createItem()
        }
        
        let bundle = NSBundle.mainBundle()
        headerView = bundle.loadNibNamed("HeaderView", owner: self, options: nil).first as? UIView
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.tableHeaderView = headerView
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BNRItemStore.sharedStore.allItems.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        if indexPath.row < BNRItemStore.sharedStore.allItems.count {
            let item = BNRItemStore.sharedStore.allItems[indexPath.row]
            cell.textLabel?.text = item.description
            cell.textLabel?.font = UIFont.systemFontOfSize(20)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row < BNRItemStore.sharedStore.allItems.count {
            return 60
        } else {
            return 44
        }
    }
}

extension BNRItemsViewController {
    
    @IBAction func addNewItem(sender: UIButton) {
        
    }
    
    @IBAction func toggleEditingMode(sender: UIButton) {
        if editing {
            sender.setTitle("Edit", forState: UIControlState.Normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", forState: UIControlState.Normal)
            setEditing(true, animated: true)
        }
    }
}
