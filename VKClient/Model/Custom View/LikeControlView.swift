//
//  LikeControlView.swift
//  VKClient
//
//  Created by Jane Z. on 02.07.2022.
//

import UIKit

protocol LikeControlProtocol: AnyObject {
    func pressedLike(likeState: Bool, counter: Int)
}

@IBDesignable class LikeControlView: UIView {

  
    @IBOutlet weak var counterLable: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    
    weak var deligate: LikeControlProtocol?
    var counter = 0
    var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeControlView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
    }
    
    private func setup() {
        let xibView = loadFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        counterLable.text = String(counter)
    }
    
    func configure(isLiked: Bool, counter: Int) {
        self.counter = counter
        isPressed = isLiked
    }
    
    func likeState() {
        if isPressed {
            heartImageView.image = UIImage(systemName: "heart.fill")
        } else {
            heartImageView.image = UIImage(systemName: "heart")
        }
        counterLable.text = String(counter)
    }
    
    @IBAction func pressLikeButton(_ sender: Any) {
        isPressed = !isPressed
        if isPressed {
            counter += 1
        } else {
            counter -= 1
        }
        likeState()
        deligate?.pressedLike(likeState: isPressed, counter: counter)
    }
    
}
