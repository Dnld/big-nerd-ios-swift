//
//  BNRReminderViewController.swift
//  HypnoNerd
//
//  Created by Donald Steinert on 2/1/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRReminderViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker?
    
    @IBAction func addReminder(sender: UIButton) {
        let date = self.datePicker!.date
        print("Setting a reminder for: \(date)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
