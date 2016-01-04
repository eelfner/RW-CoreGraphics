//
//  GraphView.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2016-01-03.
//  Copyright © 2016 Eric Elfner. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {

    //Weekly sample data
    var graphPoints:[Int] = [4, 2, 6, 4, 5, 8, 3]
    
    @IBInspectable var startColor: UIColor = UIColor.redColor()
    @IBInspectable var endColor: UIColor = UIColor.greenColor()
    
    override func drawRect(rect: CGRect) {
        
        let clipWidth = rect.width / 20.0
        let clipHeight = rect.height / 20.0
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
            byRoundingCorners: UIRectCorner.AllCorners,
            cornerRadii: CGSize(width:clipWidth, height:clipHeight))
        path.addClip()
        
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.2, 0.8]
        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
        
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x:0.0, y:self.bounds.height * 1.2)
        //var endPoint = CGPoint(x:self.bounds.width / 4.0, y:self.bounds.height * 1.2)
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, [])
        
        // Note: closure expressions: columnXPoint(). columnYPoint()
        let margin:CGFloat = 20.0
        let columnXPoint = { (column:Int) -> CGFloat in
            //Calculate gap between points
            let spacer = (rect.width - margin*2 - 4) /
                CGFloat((self.graphPoints.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        let topBorder:CGFloat = rect.height / 16.0
        let bottomBorder:CGFloat = rect.height / 10.0
        let graphHeight = rect.height - topBorder - bottomBorder
        let maxValue = graphPoints.maxElement()!
        
        let columnYPoint = { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) /
                CGFloat(maxValue) * graphHeight
            y = graphHeight + topBorder - y // Flip the graph
            return y
        }
        
        // ------------------------------- draw the line graph
        UIColor.whiteColor().setFill()
        UIColor.whiteColor().setStroke()
        
        let graphPath = UIBezierPath()
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0),
            y:columnYPoint(graphPoints[0])))
        
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                y:columnYPoint(graphPoints[i]))
            graphPath.addLineToPoint(nextPoint)
        }
        graphPath.stroke()
        
        // --------------- Create the clipping path for the graph gradient
        
        CGContextSaveGState(context)
        let clippingPath = graphPath.copy() as! UIBezierPath
        clippingPath.addLineToPoint(CGPoint(x: columnXPoint(graphPoints.count - 1), y:rect.height))
        clippingPath.addLineToPoint(CGPoint(x:columnXPoint(0), y:rect.height))
        clippingPath.closePath()
        clippingPath.addClip()
        
        //UIColor.greenColor().setFill()
        //let rectPath = UIBezierPath(rect: self.bounds)
        //rectPath.fill()
        //end temporary code
        
        let highestYPoint = columnYPoint(maxValue)
        startPoint = CGPoint(x:margin, y: highestYPoint)
        endPoint = CGPoint(x:margin, y:self.bounds.height)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, [])
        CGContextRestoreGState(context)
        
        //draw the line on top of the clipped gradient
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        //Draw the circles on top of graph stroke
        for i in 0..<graphPoints.count {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: point,
                    size: CGSize(width: 5.0, height: 5.0)))
            circle.fill()
        }
        
        //Draw horizontal graph lines on the top of everything
        var linePath = UIBezierPath()
        
        //top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: rect.width - margin,
            y:topBorder))
        
        //center line
        linePath.moveToPoint(CGPoint(x:margin,
            y: graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:rect.width - margin,
            y:graphHeight/2 + topBorder))
        
        //bottom line
        linePath.moveToPoint(CGPoint(x:margin,
            y:rect.height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:rect.width - margin,
            y:rect.height - bottomBorder))
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
        
        // Text
        let tSize = rect.height / 16.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Left
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size:tSize)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        let string = "Water Consumption"
        string.drawWithRect(CGRect(x:10, y:0, width:rect.width, height:tSize*2.0), options: .UsesLineFragmentOrigin, attributes: attrs, context: nil)
    }
}
