//
//  GaleryViewController.swift
//  VKClient
//
//  Created by Jane Z. on 29.06.2022.
//

import UIKit

class GaleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // константа для регистрации вью
    let photoCollectionViewCellReuseIdentifire = "photoCollectionViewCellReuseIdentifire"
//    var photoAlbom = [MyPhoto]()
    var photoAlbomIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Регистрация collectionView
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoCollectionViewCellReuseIdentifire)
        collectionView.dataSource = self
        collectionView.delegate = self
//        photoAlbom = Storage.shared.friends[photoAlbomIndex].photoAlbum
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

}
