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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "Reminder"
        let image = UIImage(named: "Time.png")
        tabBarItem.image = image
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addReminder(sender: UIButton) {
        let date = self.datePicker!.date
        
        let note = UILocalNotification()
        note.alertBody = "Hypnotize me!"
        note.fireDate = date
        
        UIApplication.sharedApplication().scheduleLocalNotification(note)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("BNRReminderViewController loaded")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        datePicker?.minimumDate = NSDate(timeIntervalSinceNow: 60)
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
