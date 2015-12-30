//
//  ViewController.swift
//  RW-CoreGraphics
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterNSView!
    @IBOutlet weak var counterNSView: CounterNSView!
    @IBOutlet weak var counterView:CounterView!
    @IBOutlet weak var counterLabel:UILabel!
    
    @IBOutlet weak var btnPush: PushButtonNSView!
    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            if counterView.counter < 8 {
                counterView.counter++
            }
            @IBOutlet weak var textView: NSTextField!
            @IBAction func add(sender: AnyObject) {
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter--
            }
            @IBAction func addButtonSelected(sender: AnyObject) {
            }
        }
        @IBAction func sub(sender: AnyObject) {
        }
        counterLabel.text = String(counterView.counter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterView.counter = 0
        counterLabel.text = String(counterView.counter)
    }
}

