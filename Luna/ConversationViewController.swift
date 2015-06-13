//
//  ViewController.swift
//  Luna
//
//  Created by MSi on 6/13/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {

    @IBOutlet var shareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newAction(sender: AnyObject) {
        openShare(self)
    }

    @IBAction func shareAction(sender: AnyObject) {
        openShare(self)
    }
    
    func openShare(sender: AnyObject){
        self.performSegueWithIdentifier("showShare", sender: self)
    }
}

