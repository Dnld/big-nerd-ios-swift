//
//  ViewController.swift
//  Hypnosister
//
//  Created by Donald Steinert on 2/1/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var screenRect = view.bounds
        var bigRect = screenRect
        bigRect.size.width *= 2.0
//        bigRect.size.height *= 2.0
        
        let scrollView = UIScrollView.init(frame: bigRect)
        view = scrollView
        
        let hypnosisView = BNRHypnosisView.init(frame: screenRect)
        view.addSubview(hypnosisView)
        screenRect.origin.x += screenRect.size.width
        let anotherView = BNRHypnosisView.init(frame: screenRect)
        view.addSubview(anotherView)
        scrollView.contentSize = bigRect.size
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

