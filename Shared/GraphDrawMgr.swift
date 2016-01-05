//
//  GraphDraw.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2016-01-04.
//  Copyright © 2016 Eric Elfner. All rights reserved.
//

import Foundation
import CoreGraphics

struct GraphColorScheme {
    let gradient1:IXColor
    let gradient2:IXColor
}
struct Sizing {
    let rect:CGRect
    let values:[Int]
    let maxValue:Int
    let sideMargin:CGFloat
    let topMargin:CGFloat
    let bottomMargin:CGFloat
    let graphHeight:CGFloat
    let fontSize:CGFloat
    let circleSize:CGSize
    
    init(rect:CGRect, values:[Int]) {
        self.rect = rect
        self.values = values
        self.maxValue = values.maxElement() ?? 0
        self.sideMargin = rect.width / 16.0
        self.topMargin = rect.width / 12.0
        self.bottomMargin = rect.width / 10.0
        self.graphHeight = rect.height - topMargin - bottomMargin
        self.fontSize = min(rect.width, rect.height) / 14.0
        self.circleSize = CGSize(width:rect.width/50.0, height:rect.height/50.0)
    }
    func columnXPoint(column:Int) -> CGFloat {
        let colWidth = (rect.width - sideMargin*2) / CGFloat((values.count - 1))
        let x:CGFloat = sideMargin + CGFloat(column) * colWidth
        return x
    }
    func columnYPoint(graphPoint:Int) -> CGFloat {
        let yPoints:CGFloat = graphHeight * (CGFloat(graphPoint) / CGFloat(maxValue))
        let y = graphHeight + topMargin - yPoints // Flip the graph
        return y
    }
}

class GraphDrawMgr {
    let scheme:GraphColorScheme
    let gradient:CGGradient
    var sizing:Sizing!

    init(scheme:GraphColorScheme) {
        self.scheme = scheme
        let colors = [scheme.gradient1.CGColor, scheme.gradient2.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.1, 1.0]
        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)!
        self.gradient = gradient
    }
    func drawConsumptionGraphIn(rect:CGRect, values:[Int]) {
        self.sizing = Sizing(rect:rect, values:values)
        
        drawBackgroundWithGradient()
        let graphPath  = pathForPoints()
        drawGraphBelowFromPath(graphPath)
        graphPath.lineWidth = 2.0
        graphPath.stroke() // Graph line on top of the clipped gradient
        
        drawCirclePoints()
        drawHorizontalLines()
        drawText()
    }
    func drawBackgroundWithGradient() {
        let context = graphicsContext()
        let path = IXBezierPath(roundedRect:sizing.rect, cornerRadius:sizing.sideMargin)
        path.addClip()
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0.0, y:sizing.rect.height)
        //var endPoint = CGPoint(x:self.bounds.width / 4.0, y:self.bounds.height * 1.2) //skewed variation
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, [])
    }

    func drawText() {
        let string = "Water Consumption"
        string.drawInRect(CGRect(x:10, y:0, width:sizing.rect.width, height:sizing.fontSize*2.0), withAttributes:IXStyle.font1ForSize(sizing.fontSize))
        //string.drawWithRect(CGRect(x:10, y:0, width:sizing.rect.width, height:sizing.fontSize*2.0), options:.UsesLineFragmentOrigin, attributes:attrs, context:nil)
    }
    func drawHorizontalLines() {
        let linePath = IXBezierPath()
        
        let x1 = sizing.sideMargin
        let x2 = sizing.rect.width - sizing.sideMargin
        
        //top line
        linePath.ppMoveToX(x1, y:sizing.topMargin)
        linePath.ppLineToX(x2, y:sizing.topMargin)
        
        let yCenter = sizing.graphHeight/2 + sizing.topMargin
        linePath.ppMoveToX(x1, y:yCenter)
        linePath.ppLineToX(x2, y:yCenter)
        
        let yBottom = sizing.rect.height - sizing.bottomMargin
        linePath.ppMoveToX(x1, y:yBottom)
        linePath.ppLineToX(x2, y:yBottom)
        let color = IXColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
    }
    func drawCirclePoints() {
        //Draw the circles on top of graph stroke
        for i in 0..<sizing.values.count {
            var point = CGPoint(x:sizing.columnXPoint(i), y:sizing.columnYPoint(sizing.values[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            let cSize = CGSize(width: 5.0, height: 5.0)
            let circle = IXBezierPath(ovalInRect:CGRect(origin:point, size:cSize))
            circle.fill()
        }
    }
    func drawGraphBelowFromPath(graphPath:IXBezierPath) {
        let context = graphicsContext()
        CGContextSaveGState(context)
        
        let clippingPath = graphPath.copy() as! IXBezierPath
        clippingPath.ppLineToX(sizing.columnXPoint(sizing.values.count - 1), y:sizing.rect.height)
        clippingPath.ppLineToX(sizing.columnXPoint(0), y:sizing.rect.height)
        clippingPath.closePath()
        clippingPath.addClip()
        
        //UIColor.greenColor().setFill()
        //let rectPath = UIBezierPath(rect:sizing.rect)
        //rectPath.fill()
        //end temporary code
        
        let maxValue = sizing.maxValue
        let highestYPoint = sizing.columnYPoint(maxValue)
        let startPoint = CGPoint(x:sizing.sideMargin, y:highestYPoint*1.8)
        let endPoint = CGPoint(x:sizing.sideMargin, y:sizing.rect.height)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, [])
        CGContextRestoreGState(context)
    }
    func pathForPoints() -> IXBezierPath {
        IXColor.whiteColor().setFill()
        IXColor.whiteColor().setStroke()
        
        let graphPath = IXBezierPath()
        graphPath.moveToPoint(CGPoint(x:sizing.columnXPoint(0), y:sizing.columnYPoint(sizing.values[0])))
        
        for i in 1..<sizing.values.count {
            graphPath.ppLineToX(sizing.columnXPoint(i), y: sizing.columnYPoint(sizing.values[i]))
        }
        return graphPath
    }
}
