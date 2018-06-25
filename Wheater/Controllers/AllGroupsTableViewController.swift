//
//  AllGroupsTableViewController.swift
//  Wheater
//
//  Created by Артем Сошников on 25.06.2018.
//  Copyright © 2018 Артем Сошников. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {
    private var cellId = "groupCell"
    var groups = [Group]()
    @IBOutlet weak var searchBar:UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = Group.groups
        searchBar.delegate = self
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GroupTableViewCell
        
        cell.setGroup(groups[indexPath.row])
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.groups = Group.groups.filter { group in group.name.starts(with: searchText)}
        tableView.reloadData()
    }
}
