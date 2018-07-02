//
//  Group.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation

class Group {
    var id:Int
    var name:String
    var imageUri:String
    
    init(id:Int, name:String, imageUri:String) {
        self.id = id
        self.name = name
        self.imageUri = imageUri
    }
}
