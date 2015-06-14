//
//  ViewController.swift
//  Luna
//
//  Created by MSi on 6/13/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var messagesTable: UITableView!
    @IBOutlet var shareButton: UIButton!
    let defaults = NSUserDefaults.standardUserDefaults()
    var messages: Messages = Messages.sharedInstance
    var messagesArray: [Messages] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setBool(false, forKey: "sentMessages")
        self.messagesTable.delegate = self
        self.messagesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.messagesTable.hidden = true
        self.shareButton.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if self.messages.all.count > 0 {
           self.messagesArray = [self.messages]
        }
        if (self.messagesArray.count == 0) {
            self.shareButton.hidden = false
        } else {
            self.messagesTable.hidden = false
            self.messagesTable.reloadData()
        }
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.messagesTable.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let mes: Messages = self.messagesArray[indexPath.row]
        cell.textLabel?.text = ""
        if mes.all.count > 0 {
            cell.textLabel?.text = mes.all.last!.content
        }
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let messageArray:Messages = self.messagesArray[indexPath.row]
        self.defaults.setValue(messageArray.conversationID, forKey: "conversationID")
        openShare(self)
    }

}

