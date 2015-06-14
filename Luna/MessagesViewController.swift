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
    var messages: Messages = Messages.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

        messageField.delegate = self
        messageTable.delegate = self
        self.messageTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
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
        textField.text = ""
        self.view.endEditing(true)
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
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 250
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 250
    }

}
