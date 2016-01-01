//
//  PushButtonNSView.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

// Helpful links
// http://stackoverflow.com/questions/16838525/custom-nsbuttoncell-drawbezelwithframe-not-called
// http://stackoverflow.com/questions/4533759/how-to-code-nsbutton-to-look-just-like-image

import Cocoa

@IBDesignable
class PushButtonNSView: NSButton {
    
    override var flipped:Bool { return true }
    
    @IBInspectable var fillColor:NSColor = NSColor.greenColor()
    @IBInspectable var isAddButton:Bool = true

    required init?(coder: NSCoder) {
        super.init(coder:coder)
        cell = NSButtonCell()
        cell?.bordered = false       // Else will automatically get border
    }
    
    override func drawRect(rect: NSRect) {
        super.drawRect(rect)
        SharedDraw.drawButtonInRect(rect, withFillColor:fillColor, isAdd: isAddButton)
    }
}
