//
//  ConversationViewController.swift
//  Luna
//
//  Created by Raja Hafify Zaed on 6/13/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import Foundation
import UIKit
import SwiftHTTP

class MessagesViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet var messageField: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    var selectedMessages: AnyObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageField.delegate = self
        selectedMessages = defaults.valueForKey("selectedMessages")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println(messageField.text);
        var request = HTTPTask()
        request.GET("http://google.com", parameters: nil, completionHandler: {(response: HTTPResponse) in
            if let err = response.error {
                println("error: \(err.localizedDescription)")
                self.defaults.setBool(true, forKey: "sentMessages")
                return //also notify app of failure as needed
            }
            if let data = response.responseObject as? NSData {
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("response: \(str)") //prints the HTML of the page
            }
        })
        self.navigationController?.popViewControllerAnimated(true)
        return true
    }
}
