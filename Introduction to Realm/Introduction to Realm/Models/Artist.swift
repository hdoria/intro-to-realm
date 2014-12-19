//
//  Artist.swift
//  Introduction to Realm
//
//  Created by Hugo Doria on 19/12/14.
//  Copyright (c) 2014 Hugo Doria. All rights reserved.
//

import Realm

class Artist: RLMObject {
    dynamic var name = ""
    dynamic var country = ""
    
    override class func primaryKey() -> String! {
        return "name"
    }
}