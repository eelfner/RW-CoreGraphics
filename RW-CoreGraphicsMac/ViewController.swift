//
//  ViewController.swift
//  RW-CoreGraphicsMac
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var counterNSView: CounterNSView!
    @IBOutlet weak var tField: NSTextField!
    
    @IBAction func btnPush(button: PushButtonNSView) {
        if button.isAddButton {
            if counterNSView.counter < 8 {
                counterNSView.counter++
            }
        } else {
            if counterNSView.counter > 0 {
                counterNSView.counter--
            }
        }
        tField.stringValue = String(counterNSView.counter)
    }
    @IBAction func add(sender: AnyObject) {
        if counterNSView.counter < 8 {
            counterNSView.counter++
            tField.stringValue = String(counterNSView.counter)
        }
    }
    @IBAction func sub(sender: AnyObject) {
        if counterNSView.counter > 0 {
            counterNSView.counter--
            tField.stringValue = String(counterNSView.counter)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterNSView.counter = 0
        tField.stringValue = String(counterNSView.counter)
    }
}

