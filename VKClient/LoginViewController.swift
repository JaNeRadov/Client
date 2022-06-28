//
//  ViewController.swift
//  VKClient
//
//  Created by Jane Z. on 28.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var wellcomeLable: UILabel!
    @IBOutlet weak var loginLable: UILabel!
    @IBOutlet weak var passwordLable: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //реализация скрытия клавиатуры
        let tapRecognaizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapRecognaizer)

        
    }

    //функция скрытия клавиатуры при тапе по экрану
    @objc func onTap() {
        self.view.endEditing(true)
    }
   
    
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        // логика авторизации
        
        // Получаем текст логина
        let login = loginInput.text
        // Получаем текст - пароль
        let password = passwordInput.text
    }
    
}

