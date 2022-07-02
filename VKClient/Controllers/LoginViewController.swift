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
    
    
    func filldata() -> [Friend] {
        
        let myPhoto = MyPhoto(url: "Iam")
        let friendOne = Friend(name: "Jane", age: "25", avatar: "Iam", photoAlbom: [myPhoto])
        
        
        var friendsArray = [Friend]()
        friendsArray.append(friendOne)
        
       
        return friendsArray
    }
    
    
    
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
            UIView.transition(with: logoImageView, duration: 0.5, options: []) { [ weak self ] in
                guard let self = self else { return }
                let translationLogoImage = CGAffineTransform(translationX: 0, y: -300)
                self.logoImageView.transform = translationLogoImage
            }
// Анимация смещения wellcomeLable вправо
            UIView.transition(with: wellcomeLable, duration: 0.5, options: []) { [ weak self ] in
                guard let self = self else { return }
                let translationWellcomeLable = CGAffineTransform(translationX: 300, y: 0)
                self.wellcomeLable.transform = translationWellcomeLable
            }
// Анимация смещения loginLable влево
            UIView.transition(with: loginLable, duration: 0.5, options: []) { [ weak self ] in
                guard let self = self else { return }
                let translationLoginLable = CGAffineTransform(translationX: -300, y: 0)
                self.loginLable.transform = translationLoginLable
            }
// Анимация смещения поля ввода логина вправо
            UIView.transition(with: loginInput, duration: 0.5, options: []) { [ weak self ] in
                guard let self = self else { return }
                let translationLoginInput = CGAffineTransform(translationX: 300, y: 0)
                self.loginInput.transform = translationLoginInput
            }
// Анимация смещения passwordLable влево
            UIView.transition(with: passwordLable, duration: 0.5, options: []) { [ weak self ] in
                guard let self = self else { return }
                let translationPasswordLable = CGAffineTransform(translationX: -300, y: 0)
                self.passwordLable.transform = translationPasswordLable
            }
// Анимация смещения поля ввода пароля вправо
            UIView.transition(with: passwordInput, duration: 0.5, options: []) { [ weak self ] in
                guard let self = self else { return }
                let translationPasswordInput = CGAffineTransform(translationX: 300, y: 0)
                self.passwordInput.transform = translationPasswordInput
            }
            Storage.shared.friends = filldata()
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



