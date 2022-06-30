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
//        return Storage.shared.friends[photoAlbomIndex].photoAlbum.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionViewCellReuseIdentifire, for: indexPath) as! PhotoCollectionViewCell
        let localPhotoAlbomIndex = photoAlbomIndex
//        let currentPhotoAlbom = Storage.shared.friends[localPhotoAlbomIndex].photoAlbum
//        let image = UIImage(named:currentPhotoAlbom[indexPath.item].url)
       
        
        if indexPath.item % 2 == 0{
            cell.configure(image: image, isliked: currentPhotoAlbom[indexPath.item].isLiked, likeCounter: currentPhotoAlbom[indexPath.item].likeCounter, onLikeClosure: { isLikePressed, currentCounter in
                print("counter \(currentCounter)")
                print((isLikePressed ? "true" : "false" ))
                Storage.shared.friends[localPhotoAlbomIndex].photoAlbum[indexPath.item].isLiked = isLikePressed
                Storage.shared.friends[localPhotoAlbomIndex].photoAlbum[indexPath.item].likeCounter = currentCounter
                
                
            })
        }
        return cell
    }
}
