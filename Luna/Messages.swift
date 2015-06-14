//
//  Messages.swift
//  Luna
//
//  Created by Raja Hafify Zaed on 6/14/15.
//  Copyright (c) 2015 MSi. All rights reserved.
//

import Foundation

class Messages {
    class var sharedInstance: Messages {
        struct Static {
            static var instance: Messages?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = Messages()
        }
        return Static.instance!
    }
    var all: [Message] = []
    var conversationID:Int = Int()
    
    func append(message: Message){
        self.all.append(message)
    }
}
