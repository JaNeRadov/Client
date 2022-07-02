//
//  ViewController+dataSource.swift
//  VKClient
//
//  Created by Jane Z. on 29.06.2022.
//

import UIKit

extension MyFreandsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriedns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReusedIdentifire, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        let friend = myFriedns[indexPath.row]
        cell.configure(image: UIImage(named: friend.avatar!), name: friend.name, description: friend.age)
        
        return cell
    }
}


extension GaleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return Storage.shared.friends[photoAlbomIndex].photoAlbom.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionViewCellReuseIdentifire, for: indexPath) as! PhotoCollectionViewCell
        let localPhotoAlbomIndex = photoAlbomIndex
        let currentPhotoAlbom = Storage.shared.friends[localPhotoAlbomIndex].photoAlbom
        let image = UIImage(named:currentPhotoAlbom[indexPath.item].url)
        
        if indexPath.item % 2 == 0 {
            cell.configure(image: image,
                           isliked: currentPhotoAlbom[indexPath.item].isLiked,
                           likeCounter: currentPhotoAlbom[indexPath.item].likeCounter) { isLikePress, currentCounter in
                Storage.shared.friends[localPhotoAlbomIndex].photoAlbom[indexPath.item].isLiked = isLikePress
                Storage.shared.friends[localPhotoAlbomIndex].photoAlbom[indexPath.item].likeCounter = currentCounter
            }
        }
        
        return cell
    }
}

extension AllGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let group = allGroups[indexPath.row]
        cell.configure(image: UIImage(named: group.avatar), name: group.name, description: group.description)
        cell.configure(self.allGroups[indexPath.row])
        return cell
    }
}

extension MyGroupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse,
                                                       for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let group = myGroups[indexPath.row]
        cell.configure(image: UIImage(named: group.avatar),
                       name: group.name,
                       description: group.description)
        cell.configure(self.myGroups[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
}
