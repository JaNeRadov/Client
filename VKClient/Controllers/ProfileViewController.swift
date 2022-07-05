//
//  ProfileViewController.swift
//  VKClient
//
//  Created by Jane Z. on 29.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var secondNameLable: UILabel!
    @IBOutlet weak var ageLable: UILabel!
    
    var myPhoto = [MyPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var session = Profile.insance
        session.name = "Jane"
        session.secondName = "Radov"
        session.age = "25"
        session.id = 1
        
        nameLable.text = session.name
        secondNameLable.text = session.secondName
        ageLable.text = session.age
        profileImageView.image = UIImage(named: "Iam")
    
    }
    
}
