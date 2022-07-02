//
//  PhotoCollectionViewCell.swift
//  LessonTableAndColectionView
//
//  Created by Jane Z. on 06.06.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
//    @IBOutlet weak var likeControllView: LikeControlView!
    var onLikeClosure: ((Bool, Int) -> Void)?
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
//        likeControllView.configure(isLiked: false, counter: 0)
//        onLikeClosure = nil
    }
    
    
    func configure(image: UIImage?, isliked: Bool, likeCounter: Int, onLikeClosure: @escaping (Bool, Int) -> Void) {
        photoImageView.image = image
        photoImageView.layer.cornerRadius = 50
//        likeControllView.configure(isLiked: isliked, counter: likeCounter)
//        likeControllView.delegate = self
//        self.onLikeClosure = onLikeClosure
    }
   
}
 
extension PhotoCollectionViewCell: LikeControlProtocol {
    func pressedLike(likeState: Bool, counter: Int) {
        self.onLikeClosure?(likeState, counter)
    }
//
//
//
//}
