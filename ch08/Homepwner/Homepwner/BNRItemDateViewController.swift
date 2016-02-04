//
//  BNRItemDateViewController.swift
//  Homepwner
//
//  Created by Donald Steinert on 2/3/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRItemDateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var item: BNRItem!
    
    init(withItem item: BNRItem) {
        let bundle = NSBundle.mainBundle()
        super.init(nibName: "BNRItemDateViewController", bundle: bundle)
        
        self.item = item
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func viewWillAppear(animated: Bool) {
//        datePicker.date = item.date
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = item.date
    }
    
    override func viewWillDisappear(animated: Bool) {
        item.date = datePicker.date
    }
    

}
