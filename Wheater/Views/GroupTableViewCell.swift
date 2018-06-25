//
//  GroupTableViewCell.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var name:UILabel?
    @IBOutlet weak var groupImage:UIImageView?
    
    func setGroup(_ group: Group) {
        name?.text = group.name
        groupImage?.image = UIImage(named: group.imageUri)
    }
}
