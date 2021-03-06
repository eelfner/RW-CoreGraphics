//
//  ViewController.swift
//  RW-CoreGraphicsMac
//
//  Created by Eric Elfner on 2015-12-30.
//  Copyright © 2015 Eric Elfner. All rights reserved.
//

import Cocoa

class MacViewController: NSViewController {
    
    @IBOutlet weak var counterNSView: CounterNSView!
    @IBOutlet weak var tField: NSTextField!
    @IBOutlet weak var tabView: NSTabView!
    
    override func viewDidLoad() {
        if #available(OSX 10.10, *) {
            super.viewDidLoad()
        }         
        counterNSView.counter = 0
        tField.stringValue = String(counterNSView.counter)
    }

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
        tabView.selectTabViewItemAtIndex(0)
    }

    override func viewDidDisappear() {
        exit(0)
    }
}

