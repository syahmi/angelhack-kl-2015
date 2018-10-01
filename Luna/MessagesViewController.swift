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
    let defaults = UserDefaults.standard
    var messages: Messages = Messages()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

        messageField.delegate = self
        messageTable.delegate = self
        self.messageTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        let dateString = "2014-07-05"
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let message = Message(content: "hello poeple", createdAt: dateFormatter.date(from: dateString)! as NSDate, senderID: 1, receiverID: 2)
        self.messages.append(message: message)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
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
        self.navigationController?.popViewController(animated: true)
        return true
    }
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.messageTable.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = self.messages.all[indexPath.row].content
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let message:Message = self.messages.all[indexPath.row]
    }

}
