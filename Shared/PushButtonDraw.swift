//
//  PushButtonDraw.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import Foundation
import CoreGraphics

class PushButtonDraw {
    static func drawButtonInRect(rect: CGRect) {
        let path = IXBezierPath(ovalInRect:rect)
        IXColor.blueColor().setFill()
        path.fill()
        
        let plusHeight:CGFloat = 3.0
        let plusWidth:CGFloat = min(rect.width, rect.height) * 0.6
        
        let plusPath = IXBezierPath()
        plusPath.lineWidth = plusHeight
        plusPath.ppMoveToX(rect.width/2 - plusWidth/2, y:rect.height/2)
        plusPath.ppLineToX(rect.width/2 + plusWidth/2, y:rect.height/2)
        plusPath.ppMoveToX(rect.width/2 + 0.5, y:rect.height/2 - plusWidth/2)
        plusPath.ppLineToX(rect.width/2 + 0.5, y:rect.height/2 + plusWidth/2)
        
        IXColor.whiteColor().setStroke()
        plusPath.stroke()
    }
}