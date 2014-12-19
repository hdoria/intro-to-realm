//
//  Album.swift
//  Introduction to Realm
//
//  Created by Hugo Doria on 19/12/14.
//  Copyright (c) 2014 Hugo Doria. All rights reserved.
//

import Realm

class Album: RLMObject {
    dynamic var name = ""
    dynamic var genre = ""
    dynamic var year = ""
    dynamic var coverUrl = ""
    dynamic var artist: Artist?
    
    override class func primaryKey() -> String! {
        return "name"
    }
}
