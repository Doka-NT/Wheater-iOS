//
//  Group.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import RealmSwift

class Group:Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var name:String = ""
    @objc dynamic var imageUri:String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id:Int, name:String, imageUri:String) {
        self.init()
        self.id = id
        self.name = name
        self.imageUri = imageUri
    }
}
