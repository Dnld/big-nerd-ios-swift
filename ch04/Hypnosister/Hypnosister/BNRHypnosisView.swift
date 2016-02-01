//
//  BNRHypnosisView.swift
//  Hypnosister
//
//  Created by Donald Steinert on 2/1/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRHypnosisView: UIView {

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
        
        let radius = min(bounds.size.height, bounds.size.width) / 2.0
        let path = UIBezierPath()
        path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
//        path.fill()
        path.lineWidth = 10
        UIColor.lightGrayColor().setStroke()
        path.stroke()
    }

}
