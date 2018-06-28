//
//  FriendsTableViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import UIKit

class FriendsTableViewController: UITableViewController {
    let friendCellId = "friendCell"
    
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friends = Friend.getFriends()
        
        // запрос к API друзей
        try! VKClient.getInstance().getFriends { response in
            print(response.value)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: friendCellId, for: indexPath) as! FriendTableViewCell
        
        cell.setFriend(friends[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoController = segue.destination as? PhotosCollectionViewController else {
            return
        }
        
        photoController.friend = friends[(self.tableView.indexPathForSelectedRow?.row)!]
    }
}