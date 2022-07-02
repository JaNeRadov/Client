//
//  MyGroupViewController.swift
//  VKClient
//
//  Created by Jane Z. on 02.07.2022.
//

import UIKit

class MyGroupViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchGroupBar: UISearchBar!
    
    var sourceMyGroups = [Group]()
    var myGroups = [Group]()
    let customTableViewCellReuse = "customTableViewCellReuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didPressToGroupe(_:)), name: Notification.Name("pressToGroup"),
                                               object: nil)
        searchGroupBar.delegate = self
    }
    @objc func didPressToGroupe(_ notification: Notification) {
        guard let group = notification.object as? Group else { return }
        
        if !myGroups.contains(where: {groupItem in groupItem.name == group.name}) {
            myGroups.append(group)
            tableView.reloadData()
        }
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
