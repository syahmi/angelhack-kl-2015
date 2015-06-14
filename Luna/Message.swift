//
//  File.swift
//  Luna
//
//  Created by Raja Hafify Zaed on 6/14/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import Foundation

class Message {
    var content:String = ""
    var createdAt:NSDate = NSDate.new()
    var senderID:String = String()
    var receiverID:String = String()
    
    init(content:String, createdAt:NSDate, senderID:String, receiverID:String){
        self.content = content
        self.createdAt = createdAt
        self.senderID = senderID
        self.receiverID = receiverID
    }
}
