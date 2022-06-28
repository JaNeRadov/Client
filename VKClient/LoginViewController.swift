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
    
    
    let toTabBarController = "toTabBarController"
    
    
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
   
    @IBAction func pressLoginButton(_ sender: Any) {
        
        
        }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       //проверяем данные
        let checkResult = checkUserData()
        if !checkResult { showLoginError()}
        return checkResult
    }
    
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
              let password = passwordInput.text else { return false }
                
        if login == "admin" && password == "admin" {
            return true
        } else { return false }
    }
    
    func showLoginError() {
        
        let alter = UIAlertController(title: "Error",
                                      message: "Неверные логин и/или пароль",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alter.addAction(action)
        
        present(alter, animated: true, completion: nil)
    }
}

