//
//  ViewController.swift
//  HypnoNerd
//
//  Created by Donald Steinert on 2/1/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRHypnosisViewController: UIViewController, UITextFieldDelegate {
    
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
//        print("BNRHypnosisViewController loaded")

        let textField = UITextField(frame: CGRectMake(40, 70, 300, 30))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.placeholder = "Hypnotize me"
        textField.returnKeyType = UIReturnKeyType.Done
        textField.delegate = self
        view.addSubview(textField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let text = textField.text {
            drawHypnoticMessage(text)
        }
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    
    func drawHypnoticMessage(message: String) {
        for _ in 0 ..< 20 {
            let messageLabel = UILabel()
            messageLabel.backgroundColor = UIColor.clearColor()
            messageLabel.textColor = UIColor.blackColor()
            messageLabel.text = message
            messageLabel.sizeToFit()
            
            let width = view.bounds.width - messageLabel.bounds.width
            let x = CGFloat(arc4random()) % width
            let height = view.bounds.height - messageLabel.bounds.height
            let y = CGFloat(arc4random()) % height
            
            messageLabel.frame.origin = CGPointMake(x, y)
            view.addSubview(messageLabel)
            
            var motionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis)
            motionEffect.minimumRelativeValue = -25
            motionEffect.maximumRelativeValue = 25
            messageLabel.addMotionEffect(motionEffect)
            motionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.TiltAlongVerticalAxis)
            motionEffect.minimumRelativeValue = -25
            motionEffect.maximumRelativeValue = 25
            messageLabel.addMotionEffect(motionEffect)
        }
    }
    
}

