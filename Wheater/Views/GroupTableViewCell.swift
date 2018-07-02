//
//  GroupTableViewCell.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit
import Kingfisher

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var name:UILabel?
    @IBOutlet weak var groupImage:UIImageView?
    
    func setGroup(_ group: Group) {
        name?.text = group.name
        let url = URL(string: group.imageUri)
        groupImage?.kf.setImage(with: url)
    }
}
