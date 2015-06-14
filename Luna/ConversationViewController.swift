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
    var messages: Messages = Messages()
    var messagesArray: [Messages] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setBool(false, forKey: "sentMessages")
        self.messagesTable.delegate = self
        self.messagesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let dateString = "2014-07-05"
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let message = Message(content: "hello poeple", createdAt: dateFormatter.dateFromString(dateString)!, senderID: 1, receiverID: 2)
        self.messages.append(message)
        self.messagesArray = [messages]
        self.messagesTable.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        var sentMessage:Bool = defaults.valueForKey("sentMessages") as! Bool
        if (sentMessage) {
             messagesTable.hidden = true
        } else {
            shareButton.hidden = true
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
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let messageArray:Messages = self.messagesArray[indexPath.row]
        var dict : NSDictionary = ["key":"value"]
        var array1: NSArray = dict.allValues // Create a dictionary and assign that to this array
        defaults.setObject(array1, forKey: "selectedMessages")
        openShare(self)
    }

}

