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
    var senderID:Int = 0
    var receiverID:Int = 0
    
    init(content:String, createdAt:NSDate, senderID:Int, receiverID:Int){
        self.content = content
        self.createdAt = createdAt
        self.senderID = senderID
        self.receiverID = receiverID
    }
}
