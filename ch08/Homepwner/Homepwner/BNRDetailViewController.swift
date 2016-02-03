//
//  BNRDetailViewController.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/3/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRDetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!

    var item: BNRItem!
    
    init(withItem item: BNRItem) {
        let bundle = NSBundle.mainBundle()
        super.init(nibName: "BNRDetailViewController", bundle: bundle)
        
        self.item = item
        self.navigationItem.title = item.name
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialField.text = item.serialNumber
        valueField.text = String(item.valueInDollars)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateLabel.text = dateFormatter.stringFromDate(item.date)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
        item.name = nameField.text!
        item.serialNumber = serialField.text!
        if let newValue = Int(valueField.text!) {
            item.valueInDollars = newValue
        }
    }
    
    // this ends editing when user taps outside displayed keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
}
