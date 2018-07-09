//
//  Photo.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import RealmSwift

class Photo:Object {
    @objc dynamic var uri:String = ""
    
    convenience init(uri:String) {
        self.init()
        self.uri = uri
    }
}
