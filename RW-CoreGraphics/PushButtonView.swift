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

    override func drawRect(rect: CGRect) {
        PushButtonDraw.drawButtonInRect(rect)
    }
}