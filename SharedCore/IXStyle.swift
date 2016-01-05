//
//  IXStyle.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2016-01-05.
//  Copyright © 2016 Eric Elfner. All rights reserved.
//
// This class encapsulates text styling so it can be used across OSX and iOS.

import Foundation
#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

class IXStyle {
    static func font1ForSize(size:CGFloat) ->  [String : NSObject] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Left
        let attrs = [
            NSFontAttributeName:IXFont(name:"HelveticaNeue", size:size)!,
            NSForegroundColorAttributeName:IXColor(white:0.95, alpha:1.0),
            NSParagraphStyleAttributeName: paragraphStyle
        ]
        
        return attrs;
    }
}