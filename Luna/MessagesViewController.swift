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

class MessagesViewController : UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var messageTable: UITableView!
    @IBOutlet var messageField: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    var messages: Messages = Messages(conversationID: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

        messageField.delegate = self
        messageTable.delegate = self
        self.messageTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        let dateString = "2015-06-12"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let message = Message(content: "hello poeple", createdAt: dateFormatter.dateFromString(dateString)!, senderID: "hackangel", receiverID: "angelhack")
        self.messages.append(message)
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let dateString = "2015-06-14"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var newMessage = Message(content: textField.text, createdAt: dateFormatter.dateFromString(dateString)!, senderID:"angelhack", receiverID: "hackangel")
        self.messages.append(newMessage)
        self.messageTable.reloadData()
//        var request = HTTPTask()
//        request.GET("http://google.com", parameters: nil, completionHandler: {(response: HTTPResponse) in
//            if let err = response.error {
//                println("error: \(err.localizedDescription)")
//                self.defaults.setBool(true, forKey: "sentMessages")
//                return //also notify app of failure as needed
//            }
//            if let data = response.responseObject as? NSData {
//                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//                println("response: \(str)") //prints the HTML of the page
//            }
//        })
        return true
    }
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.all.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.messageTable.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = self.messages.all[indexPath.row].content
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let message:Message = self.messages.all[indexPath.row]
    }

}
