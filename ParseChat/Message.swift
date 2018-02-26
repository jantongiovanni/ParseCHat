//
//  Message.swift
//  ParseChat
//
//  Created by Joe Antongiovanni on 2/25/18.
//  Copyright © 2018 Joe Antongiovanni. All rights reserved.
//

import UIKit
import Parse

class Message: PFObject, PFSubclassing {
    
    @NSManaged var message: String
    
    class func parseClassName() -> String {
        return "Message"
    }
    
}
