//
//  Friend.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import UIKit

class Friend {
    var id: Int
    var name: String
    var image: UIImage
    
    init(id:Int, name:String, imageName: String) {
        self.id = id
        self.name = name
        self.image = UIImage(named: imageName)!
    }

    static func getFriends() -> [Friend] {
        return [
            self.init(id:1, name:"Иванов Петр Семенович", imageName:"friend-1"),
            self.init(id:2, name:"Казинский Евгений Михайлович", imageName:"friend-1"),
            self.init(id:3, name:"Васина Елена Юрьевна", imageName:"friend-2"),
            self.init(id:4, name:"Малевич Виктор Григорьевич", imageName:"friend-3"),
            self.init(id:5, name:"Потопов Михаил Викторивич", imageName:"friend-1"),
            self.init(id:6, name:"Веселая Юлия Владимировна", imageName:"friend-2"),
            self.init(id:7, name:"Измайлов Роман Васильевич", imageName:"friend-3"),
            self.init(id:8, name:"Кущин Александр Андреевич", imageName:"friend-1"),
            self.init(id:9, name:"Самохина Алена Дмитриевна", imageName:"friend-2"),
            self.init(id:10, name:"Головин Сергей Олегович", imageName:"friend-3"),
            self.init(id:11, name:"Головина Василиса Валерьевна", imageName:"friend-2"),
        ]
    }
}
