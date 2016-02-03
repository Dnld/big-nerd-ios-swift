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
        } else {
            cell.selectionStyle = UITableViewCellSelectionStyle.None
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
        let newItem = BNRItemStore.sharedStore.createItem()
        if let lastRow = BNRItemStore.sharedStore.allItems.indexOf(newItem) {
            let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        }
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
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == BNRItemStore.sharedStore.allItems.count {
            return
        }

        if editingStyle == UITableViewCellEditingStyle.Delete {
            let item = BNRItemStore.sharedStore.allItems[indexPath.row]
            BNRItemStore.sharedStore.removeItem(item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let lastItemIndex = BNRItemStore.sharedStore.allItems.count + 1
        if sourceIndexPath == destinationIndexPath || destinationIndexPath.row == lastItemIndex {
            return
        }
        BNRItemStore.sharedStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        } else {
            return proposedDestinationIndexPath
        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Remove"
    }
    
    override func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        if indexPath.row == BNRItemStore.sharedStore.allItems.count {
            return false
        } else {
            return true
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row == BNRItemStore.sharedStore.allItems.count {
            return false
        } else {
            return true
        }
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row == BNRItemStore.sharedStore.allItems.count {
            return false
        } else {
            return true
        }
    }
}
