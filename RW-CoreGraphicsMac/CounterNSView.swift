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
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: NSColor = NSColor.blueColor()
    @IBInspectable var counterColor: NSColor = NSColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        SharedDraw.drawArcInRect(rect, withColor:counterColor)
    }
}
