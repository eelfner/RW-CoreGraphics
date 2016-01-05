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
        let scheme = GraphColorScheme(gradient1:startColor, gradient2:endColor)
        let graphDrawMgr = GraphDrawMgr(scheme:scheme)
        graphDrawMgr.drawConsumptionGraphIn(rect, values:graphPoints)
    }
}
