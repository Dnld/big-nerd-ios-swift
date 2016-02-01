//
//  ViewController.swift
//  HypnoNerd
//
//  Created by Donald Steinert on 2/1/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRHypnosisViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = "Hypnotize"
        let image = UIImage(named: "Hypno.png")
        tabBarItem.image = image
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = UIScreen.mainScreen().bounds
        let backgroundView = BNRHypnosisView.init(frame: frame)
        view = backgroundView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

