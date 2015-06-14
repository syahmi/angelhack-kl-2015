//
//  Messages.swift
//  Luna
//
//  Created by Raja Hafify Zaed on 6/14/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import Foundation

class Messages {
    var all: [Message] = []
    var conversationID:Int = Int()
    
    init(conversationID:Int){
        self.conversationID = conversationID
    }
    
    func append(message: Message){
        self.all.append(message)
    }
}
