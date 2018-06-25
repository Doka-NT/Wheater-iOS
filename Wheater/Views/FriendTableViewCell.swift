//
//  FriendTableViewCell.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    func setFriend(_ friend: Friend) {
        friendName.text = friend.name
        friendImage.image = friend.image
    }
}
