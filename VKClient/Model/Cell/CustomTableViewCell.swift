//
//  CustomTableViewCell.swift
//  TableViewExample
//
//  Created by Jane Z. on 01.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }
    
    func configure(image: UIImage?, name: String?, description: String?){
        
        photoImageView.image = image
        nameLabel.text = name
        if let description = description{
        descriptionLabel.text = description
            descriptionLabel.textColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        }
        else{
            descriptionLabel.text = "no description"
            descriptionLabel.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        
    }
    func configure(_ group: Group){
        
        photoImageView.image = UIImage(named: group.avatar)
        nameLabel.text = group.name
        if let description = group.description{
        descriptionLabel.text = description
            descriptionLabel.textColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        }
        else{
            descriptionLabel.text = "no description"
            descriptionLabel.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        
    }
}
