//
//  ViewController.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView:UIView!
    @IBOutlet weak var graphView:GraphView!
    @IBOutlet weak var counterView:CounterView!
    @IBOutlet weak var counterLabel:UILabel!

    var isGraphViewVisible = false
    
    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            if counterView.counter < 8 {
                counterView.counter++
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter--
            }
        }
        counterLabel.text = String(counterView.counter)
        if isGraphViewVisible { counterViewTap(nil) }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterView.counter = 0
        counterLabel.text = String(counterView.counter)
    }
    @IBAction func counterViewTap(gesture:UITapGestureRecognizer?) {
        if isGraphViewVisible {
            UIView.transitionFromView(graphView, toView:counterView, duration:1.0, options:[ .TransitionFlipFromLeft, .ShowHideTransitionViews], completion:nil)
        }
        else {
            UIView.transitionFromView(counterView, toView:graphView, duration:1.0, options:[ .TransitionFlipFromRight, .ShowHideTransitionViews], completion:nil)
        }
        isGraphViewVisible = !isGraphViewVisible
    }
}

