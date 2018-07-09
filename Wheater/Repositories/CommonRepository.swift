//
//  FriendRepository.swift
//  Wheater
//
//  Created by Артем Сошников on 10.07.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import RealmSwift

class CommonRepository<T:Object> {
    private let realm = try! Realm()
    
    func all() -> Results<T> {
        return realm.objects(T.self)
    }
    
    func all(for friend:Friend) -> Results<T> {
        return realm.objects(T.self).filter("friend.id = %@", friend.id)
    }
    
    func saveAll(_ items:[T]) {
        try! realm.write {
            realm.delete(realm.objects(T.self))
            realm.add(items)
        }
    }
    
    func saveAll(_ items:[T], for friend:Friend) {
        try! realm.write {
            realm.delete(all(for:friend))
            realm.add(items)
        }
    }
    
    
}
