//
//  ViewController+Deligate.swift
//  VKClient
//
//  Created by Jane Z. on 29.06.2022.
//

import UIKit

extension MyFreandsViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == fromFreandListToGalery, let destinationController = segue.destination as? GaleryViewController, let photoArrayIndex = sender as? Int {
            destinationController.photoAlbomIndex = photoArrayIndex
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromFreandListToGalery, sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension MyFreandsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.isEmpty {
            myFriedns = sourceFriends
        } else {
            myFriedns = sourceFriends.filter({ friendItem in
                friendItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}

// MARK: - Расширение GaleryView
extension GaleryViewController: UICollectionViewDelegate {

   
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(indexPath.item)
        let fullScreenView = UIView(frame: self.view.bounds)
        let fullScreenImageView = UIImageView(frame: fullScreenView.frame)
        fullScreenView.addSubview(fullScreenImageView)
        let image = Storage.shared.friends[photoAlbomIndex].photoAlbom[indexPath.item].url
        fullScreenImageView.image = UIImage(named: image)
        self.view.addSubview(fullScreenView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        fullScreenView.addGestureRecognizer(tap)
    }
    @objc func onTap(_ recognizer: UITapGestureRecognizer) {
        guard let targetView = recognizer.view else {return}
        targetView.removeFromSuperview()
    }
 
    }

extension AllGroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = allGroups[indexPath.item]
        NotificationCenter.default.post(name: Notification.Name("pressToGroup"), object: group)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension AllGroupViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            allGroups = sourceAllGroups
        } else {
            allGroups = sourceAllGroups.filter({ allgroupsItem in
                allgroupsItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        groupTableView.reloadData()
    }
}


extension MyGroupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension MyGroupViewController: UISearchBarDelegate {
    func searcBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            myGroups = sourceMyGroups
        } else {
            myGroups = sourceMyGroups.filter({groupItem in groupItem.name.contains(searchText)})
        }
        tableView.reloadData()
    }
}
