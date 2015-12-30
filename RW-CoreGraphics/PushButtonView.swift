//
//  PushButtonView.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {

    @IBInspectable var fillColor:UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton:Bool = true
    
    override func drawRect(rect: CGRect) {
        PushButtonDraw.drawButtonInRect(rect, withFillColor: fillColor, isAdd:isAddButton)
    }
}