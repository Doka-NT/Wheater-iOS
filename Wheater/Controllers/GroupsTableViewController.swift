//
//  GroupsTableViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    private var cellId = "groupCell"
    var groups: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = Group.getMyGroups()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GroupTableViewCell;
        
        cell.setGroup(groups[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            groups.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindAddGroup(_ segue: UIStoryboardSegue) {
        guard let allGroupsTV = segue.source as? AllGroupsTableViewController else {
            return
        }
        
        if let selectedIndex = allGroupsTV.tableView.indexPathForSelectedRow?.row {
            groups.append(allGroupsTV.groups[selectedIndex])
            tableView.reloadData()
        }
    }
}
