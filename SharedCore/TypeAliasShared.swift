//
//  Created by Eric Elfner on 2015-11-11.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//
/**
Merge functionality between iOS UIKit and OSX AppKit.
IX Prefix: for iOS+OSX
*/
import Foundation

#if os(iOS)
    import UIKit
    public typealias IXImage = UIImage
    public typealias IXColor = UIColor
    public typealias IXBezierPath  = UIBezierPath

#elseif os(OSX)
    import AppKit
    public typealias IXImage = NSImage
    public typealias IXColor = NSColor
    public typealias IXBezierPath  = NSBezierPath
    
#endif
// Extenstion to make Pixel Perfect lines in all devices @1x, @2x, @3x
extension IXBezierPath {
    func ppLineToX(x:CGFloat, y:CGFloat) {
        #if os(iOS)
            addLineToPoint(ppPoint(x, y))
        #elseif os(OSX)
            lineToPoint(ppPoint(x, y))
        #endif
    }
    func ppMoveToX(x:CGFloat, y:CGFloat) {
        moveToPoint(ppPoint(x, y))
    }
    func ppPoint(x:CGFloat, _ y:CGFloat) -> CGPoint {
        let ppX = round(x) + 0.5
        let ppY = round(y) + 0.5
        return CGPoint(x:ppX, y:ppY)
    }
}