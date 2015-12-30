//
//  CounterView.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import UIKit

let NoOfGlasses = 8

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        SharedDraw.drawArcInRect(rect, withColor:counterColor, forConsumption:CGFloat(counter) / 8.0, outlinedColor:outlineColor)
    }
}