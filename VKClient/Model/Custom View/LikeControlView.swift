//
//  LikeControlView.swift
//  AltVK
//
//  Created by Jane Z. on 09.06.2022.
//

import UIKit

protocol LikeControlProtocol: AnyObject {
    func pressLike(likeState: Bool, counter: Int)
}


@IBDesignable class LikeControlView: UIView {


    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    
    weak var delegate: LikeControlProtocol?
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
    
    private func loadFomXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeControlView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
    }
    
    private func setup() {
        let xibView = loadFomXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        counterLabel.text = String(counter)
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
        counterLabel.text = String(counter)
    }
    
    @IBAction func pressLikeButton(_ sender: UIButton) {
        isPressed = !isPressed
        if isPressed {
            counter += 1
        } else {
            counter -= 1
        }
        likeState()
        delegate?.pressLike(likeState: isPressed, counter: counter)
    }
    
    
}
