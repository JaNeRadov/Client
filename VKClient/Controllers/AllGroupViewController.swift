//
//  AllGroupViewController.swift
//  VKClient
//
//  Created by Jane Z. on 02.07.2022.
//

import UIKit

class AllGroupViewController: UIViewController {

    
    @IBOutlet weak var searchAllGroupBar: UISearchBar!
    @IBOutlet weak var groupTableView: UITableView!
    
    func fillData() -> [Group] {
        let groupOne = Group(name: "Bike Club",
                             description: "Arhangelsk",
                             avatar: "Bike")
        let groupTwo = Group(name: "Pinguin Club",
                             description: "Murmansk",
                             avatar: "Pinguin")
        let groupThree = Group(name: "Nintendo Club",
                               description: "Tokio",
                               avatar: "Mario")
        var groups = [Group]()
        groups.append(groupOne)
        groups.append(groupTwo)
        groups.append(groupThree)
        
        return groups
    }
    
    var sourceAllGroups = [Group]()
    var allGroups = [Group]()
    
    let customTableViewCellReuse = "customTableViewCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroups = fillData()
        groupTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        groupTableView.dataSource = self
        groupTableView.delegate = self
        searchAllGroupBar.delegate = self
    }
    

    

}
