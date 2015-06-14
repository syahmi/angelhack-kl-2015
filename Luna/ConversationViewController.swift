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
    var items: [String] = ["Hello", "World"]
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setBool(false, forKey: "sentMessages")
        self.messagesTable.delegate = self
        self.messagesTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.messagesTable.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        defaults.setValue("SelectedObject", forKey: "Selected")
        openShare(self)
    }

}

