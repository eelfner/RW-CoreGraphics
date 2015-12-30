//
//  PushButtonNSView.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import Cocoa

@IBDesignable
class PushButtonNSView: NSView {
    
    override var flipped:Bool { return true }
    
    override func drawRect(rect: NSRect) {
        PushButtonDraw.drawButtonInRect(rect)
    }
}
