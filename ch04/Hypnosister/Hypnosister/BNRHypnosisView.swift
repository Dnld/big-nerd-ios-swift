//
//  BNRHypnosisView.swift
//  Hypnosister
//
//  Created by Donald Steinert on 2/1/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRHypnosisView: UIView {
    var circleColor: UIColor? = UIColor.lightGrayColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let centerX = bounds.origin.x + bounds.size.width / 2.0
        let centerY = bounds.origin.y + bounds.size.height / 2.0
        let center = CGPointMake(centerX, centerY)
        
//        let radius = min(bounds.size.height, bounds.size.width) / 2.0
        let maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0
        let path = UIBezierPath()
//        path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
//        path.fill()
        
        for (var currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
            path.moveToPoint(CGPointMake(center.x + currentRadius, center.y))
            path.addArcWithCenter(center, radius: currentRadius, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        }
        
        path.lineWidth = 10
        circleColor!.setStroke()
        path.stroke()
        
//        let logoImage = UIImage(named: "logo.png")
//        logoImage?.drawInRect(rect)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let red = CGFloat(arc4random() % 100) / 100.0
        let green = CGFloat(arc4random() % 100) / 100.0
        let blue = CGFloat(arc4random() % 100) / 100.0
        
        let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        circleColor = randomColor
    }

    
}
