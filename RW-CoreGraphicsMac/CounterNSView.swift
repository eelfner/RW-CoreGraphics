//
//  CounterNSView.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import Cocoa

let NoOfGlasses = 8

@IBDesignable class CounterNSView: NSView {

    override var flipped:Bool { return true }
    
    @IBInspectable var counter:Int = 5 {
        didSet {
            needsDisplay = true
        }
    }
    @IBInspectable var outlineColor: NSColor = NSColor.blueColor()
    @IBInspectable var counterColor: NSColor = NSColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        SharedDraw.drawConsumptionArcInRect(rect, withColor:counterColor, forConsumption:CGFloat(counter) / 8.0, outlinedColor:outlineColor)
    }
}
