//
//  FriendsTableViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class FriendsTableViewController: UITableViewController {
    let friendCellId = "friendCell"
    let repo = CommonRepository<Friend>()
    
    var friends: Results<Friend>!
    var token:NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromRealm()
        loadData()
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
    
    private func loadData() {
        // запрос к API друзей
        try! VKClient.getInstance().getFriends{ self.repo.saveAll($0) }
    }
    
    private func loadDataFromRealm() {
        friends = repo.all()
        
        token = friends.observe { changes in
            switch changes {
            case .initial(_):
                self.tableView.reloadData()
            case .update(_):
                self.tableView.reloadData()
            case .error(let error):
                print (error)
            }
        }
    }
}
