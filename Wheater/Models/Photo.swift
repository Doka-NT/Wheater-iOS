//
//  Photo.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation

class Photo {
    static let photos = [
        1: ["photo-1", "photo-2", "photo-3", "photo-4", "photo-5", "photo-6"],
        2: ["photo-3", "photo-4", "photo-5", "photo-6"],
        3: ["photo-1", "photo-4", "photo-5", "photo-6"],
        4: ["photo-2", "photo-3", "photo-6", "photo-4", "photo-5", "photo-1"],
        5: ["photo-1", "photo-3", "photo-4", "photo-5", "photo-6"],
        6: ["photo-1", "photo-2", "photo-3", "photo-4", "photo-5", "photo-6"],
        7: ["photo-1", "photo-2", "photo-3", "photo-4", "photo-5", "photo-6"],
        8: ["photo-1", "photo-2", "photo-3", "photo-2", "photo-5", "photo-6"],
        9: ["photo-1", "photo-2", "photo-4", "photo-4", "photo-5", "photo-6"],
        10: ["photo-1", "photo-2", "photo-3", "photo-4", "photo-5", "photo-6"],
        11: ["photo-1", "photo-2", "photo-3", "photo-4", "photo-5", "photo-6"],
    ]
    
    var uri:String
    
    init(uri:String) {
        self.uri = uri
    }
    
    static func getPhotos(for friend: Friend) -> [String] {
        return photos[friend.id]!
    }
}
