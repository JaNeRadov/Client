//
//  MyFreandsViewController.swift
//  VKClient
//
//  Created by Jane Z. on 29.06.2022.
//

import UIKit

class MyFreandsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchFreandsBar: UISearchBar!
    
    let fromFreandListToGalery =  "fromFreandListToGalery"
    
    var sourceFriends = [Friend]()
    var myFriedns = [Friend]()
    let customTableViewCellReusedIdentifire = "customTableViewCellReusedIdentifire"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriedns = Storage.shared.friends
        sourceFriends = myFriedns
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReusedIdentifire)
        searchFreandsBar.delegate = self

        
    }
    
    func tableView (_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "delete"){
            (action, view, complition) in
            self.myFriedns.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .middle)
        }
        action.backgroundColor = UIColor.red
        action.image = UIImage(systemName: "trash.fill")
        return action
    }
}
