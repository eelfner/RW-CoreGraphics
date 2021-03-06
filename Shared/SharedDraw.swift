//
//  PushButtonDraw.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import Foundation
import CoreGraphics

let π:CGFloat = CGFloat(M_PI)

class SharedDraw {
    static func developerYellowFill(rect:CGRect) {
        let path = IXBezierPath(rect:rect)
        IXColor.yellowColor().setFill()
        path.fill()
    }
    static func drawPlusMinusButtonInRect(rect:CGRect, withFillColor:IXColor, isAdd:Bool) {
        let path = IXBezierPath(ovalInRect:rect)
        withFillColor.setFill()
        path.fill()
        
        let plusHeight:CGFloat = 3.0
        let plusWidth:CGFloat = min(rect.width, rect.height) * 0.6
        
        let plusPath = IXBezierPath()
        plusPath.lineWidth = plusHeight
        plusPath.ppMoveToX(rect.width/2 - plusWidth/2, y:rect.height/2)
        plusPath.ppLineToX(rect.width/2 + plusWidth/2, y:rect.height/2)
        if isAdd {
            plusPath.ppMoveToX(rect.width/2 + 0.5, y:rect.height/2 - plusWidth/2)
            plusPath.ppLineToX(rect.width/2 + 0.5, y:rect.height/2 + plusWidth/2)
        }
        IXColor.whiteColor().setStroke()
        plusPath.stroke()
    }
    static func drawConsumptionArcInRect(rect:CGRect, withColor:IXColor, forConsumption:CGFloat, outlinedColor:IXColor) {

        let center = CGPoint(x:rect.width/2, y:rect.height/2)
        let radius: CGFloat = min(rect.width, rect.height) / 3
        let arcWidth: CGFloat = radius / 2
        let startAngle: CGFloat =  3*π / 4
        let endAngle: CGFloat = π / 4
        
        let path = IXBezierPath()
        path.lineWidth = arcWidth
        withColor.setStroke()
        path.drawArcAtCenter(center, radius:radius, startAngle:startAngle, endAngle:endAngle, bClockwise:true)
        path.stroke()

        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        let outlineEndAngle = angleDifference * forConsumption + startAngle
        let outlinePath = IXBezierPath()
        outlinePath.drawArcAtCenter(center, radius:radius + arcWidth/2.0, startAngle:startAngle, endAngle:outlineEndAngle, bClockwise:true)
        outlinePath.drawArcAtCenter(center, radius:radius - arcWidth/2.0, startAngle:outlineEndAngle, endAngle:startAngle, bClockwise:false)
        outlinePath.closePath()
        outlinedColor.setStroke()
        outlinePath.lineWidth = 2.0
        outlinePath.stroke()
    }
}