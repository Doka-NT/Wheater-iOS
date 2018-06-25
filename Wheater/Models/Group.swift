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
    
    static let groups = [
        Group(id: 1, name: "Кулинарные страсти", imageUri: "group-1"),
        Group(id: 2, name: "Беседа со скалой", imageUri: "group-2"),
        Group(id: 3, name: "Овечевание", imageUri: "group-3"),
        Group(id: 4, name: "Highload++", imageUri: "group-1"),
        Group(id: 5, name: "Разностное программирование", imageUri: "group-2"),
        Group(id: 6, name: "Экстремальная обыденность", imageUri: "group-3"),
    ]
    
    init(id:Int, name:String, imageUri:String) {
        self.id = id
        self.name = name
        self.imageUri = imageUri
    }
    
    static func getMyGroups() -> [Group] {
        return [
            groups[0],
            groups[1],
            groups[2],
        ]
    }
}
