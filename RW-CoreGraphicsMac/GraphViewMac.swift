//
//  GraphViewMac.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2016-01-04.
//  Copyright © 2016 Eric Elfner. All rights reserved.
//

import Cocoa

class GraphViewMac: NSView {

    //Weekly sample data
    var graphPoints:[Int] = [4, 2, 6, 4, 5, 8, 3]
    @IBInspectable var startColor: NSColor = NSColor.redColor()
    @IBInspectable var endColor: NSColor = NSColor.greenColor()

    override var flipped:Bool { return true }
        
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        //SharedDraw.developerYellowFill(dirtyRect)
        
        let scheme = GraphColorScheme(gradient1:startColor, gradient2:endColor)
        let graphDrawMgr = GraphDrawMgr(scheme:scheme)
        graphDrawMgr.drawConsumptionGraphIn(dirtyRect, values:graphPoints)

    }
    
}
