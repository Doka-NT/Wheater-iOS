//
//  ModelFactory.swift
//  Wheater
//
//  Created by Артем Сошников on 02.07.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import SwiftyJSON

class ModelFactory {
    static func createFriendList(_ json:JSON) -> [Friend] {
        var list:[Friend] = []
        
        let items = json["response"]["items"]
        items.forEach() { _, value in
            let lastName = value["last_name"].string ?? ""
            let firstName = value["first_name"].string ?? ""
            let id = value["id"].int ?? 0
            let imageName = value["photo_200"].string ?? ""
            
            let name = "\(lastName) \(firstName)"
            let friend = Friend(id: id, name: name, imageName: imageName)
            
            list.append(friend)
        }
        
        return list
    }
    
    static func createPhotosList(_ json:JSON) -> [Photo] {
        var list:[Photo] = []
        
        json["response"]["items"].forEach() { _, value in
            let photo = Photo(uri: value["photo_604"].string ?? "")
            list.append(photo)
        }
        
        return list
    }
    
    static func createGroupList(_ json:JSON) -> [Group] {
        var list:[Group] = []
        
        json["response"]["items"].forEach() { _, value in
            let id = value["id"].int ?? 0
            let name = value["name"].string ?? ""
            let imageUri = value["photo_200"].string ?? ""
            
            let photo = Group(id: id, name: name, imageUri: imageUri)
            list.append(photo)
        }
        
        return list
    }
}
