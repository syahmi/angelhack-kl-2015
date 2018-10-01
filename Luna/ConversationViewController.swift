//
//  ViewController.swift
//  Luna
//
//  Created by MSi on 6/13/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet var messagesTable: UITableView!
    @IBOutlet var shareButton: UIButton!
    let defaults = UserDefaults.standard
    var messages: Messages = Messages()
    var messagesArray: [Messages] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set(false, forKey: "sentMessages")
        self.messagesTable.delegate = self
        self.messagesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let dateString = "2014-07-05"
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let message = Message(content: "hello poeple", createdAt: dateFormatter.date(from: dateString)! as NSDate, senderID: 1, receiverID: 2)
        self.messages.append(message: message)
        self.messagesArray = [messages]
        self.messagesTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        var sentMessage:Bool = defaults.value(forKey: "sentMessages") as! Bool
        if (sentMessage) {
            messagesTable.isHidden = true
        } else {
            shareButton.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newAction(sender: AnyObject) {
        openShare(sender: self)
    }

    @IBAction func shareAction(sender: AnyObject) {
        openShare(sender: self)
    }
    
    func openShare(sender: AnyObject){
        self.performSegue(withIdentifier: "showShare", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesArray.count
    }
    
    private func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.messagesTable.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let mes: Messages = self.messagesArray[indexPath.row]
        cell.textLabel?.text = ""
        if mes.all.count > 0 {
            cell.textLabel?.text = mes.all.last!.content
        }
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _:Messages = self.messagesArray[indexPath.row]
        let dict : NSDictionary = ["key":"value"]
        let array1: NSArray = dict.allValues as NSArray // Create a dictionary and assign that to this array
        defaults.set(array1, forKey: "selectedMessages")
        openShare(sender: self)
    }

}

