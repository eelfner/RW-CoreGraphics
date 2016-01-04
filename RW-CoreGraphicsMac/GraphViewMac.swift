//
//  GraphViewMac.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2016-01-04.
//  Copyright © 2016 Eric Elfner. All rights reserved.
//

import Cocoa

class GraphViewMac: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        SharedDraw.developerYellowFill(dirtyRect)
    }
    
}
