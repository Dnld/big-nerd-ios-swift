//
//  BNRDrawView.swift
//  TouchTracker
//
//  Created by Donald Steinert on 2/5/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import UIKit

class BNRDrawView: UIView {

    var currentLine: BNRLine?
    var finishedLines: [BNRLine]
    
    override init(frame r: CGRect) {
        finishedLines = [BNRLine]()
        super.init(frame: r)
        backgroundColor = UIColor.grayColor()
        multipleTouchEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func strokeLine(line: BNRLine) {
        let bp = UIBezierPath()
        bp.lineWidth = 10
        bp.lineCapStyle = CGLineCap.Round
        
        bp.moveToPoint(line.begin)
        bp.addLineToPoint(line.end)
        bp.stroke()
    }
    
    override func drawRect(rect: CGRect) {
        UIColor.blackColor().set()
        
        for line in finishedLines {
            strokeLine(line)
        }
        
        if let currentLine = self.currentLine {
            UIColor.redColor().set()
            strokeLine(currentLine)
        }
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first
        let location = t?.locationInView(self)
        currentLine = BNRLine()
        currentLine?.begin = location!
        currentLine?.end = location!
        
        setNeedsDisplay()
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let t = touches.first
        let location = t?.locationInView(self)
        currentLine?.end = location
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let finishedLine = currentLine {
            finishedLines.append(finishedLine)
        }
        
        currentLine = nil
        setNeedsDisplay()
    }
    
}
