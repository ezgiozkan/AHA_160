//
//  LoginViewController.swift
//  HSU
//
//  Created by ezgi on 14.03.2021.
//

import UIKit


@available(iOS 13.0, *)
class LoginViewController: UIViewController,UITextFieldDelegate, UIGestureRecognizerDelegate {

    //MARK:IBOutlets
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loginButton: UIButton!
   
    
    //MARK:CONSTANTS
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let txtBackgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 254 / 255, alpha: 1)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoginButton()
        configureTextFields()
        configureNavBar()
        
     
    }
    
    func configureLoginButton(){
        
        self.loginButton.backViewShadow(cornerRadius: 8)
        
    }
    
    func configureTextFields(){
        
        self.emailTxtField.layer.cornerRadius = 5
        self.emailTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.emailTxtField.buttonShadow()
        self.emailTxtField.keyboardType = .emailAddress
        self.emailTxtField.delegate = self
        emailTxtField.tag = 1
        
       
        self.passwordTxtField.layer.cornerRadius = 5
        self.passwordTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.passwordTxtField.buttonShadow()
        self.passwordTxtField.delegate = self
        passwordTxtField.tag = 2
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                   nextField.becomeFirstResponder()
               } else {
                   textField.resignFirstResponder()
               }
               return false
       
    }
   
    func configureNavBar() {
        
        self.view.backgroundColor = .white
        self.title = "Giriş yap"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        print("forgot password")
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        if let email = emailTxtField.text, let password = passwordTxtField.text{
            
            if !email.isEmpty && !password.isEmpty {
                
                Network.shared.signIn(email: self.emailTxtField.text ?? "", password: self.passwordTxtField.text ?? "") { (response,token)  in
                    
                    if response == 200 && token != nil {
                        
                        DispatchQueue.main.async {
                            
                            let tabVC = TabBarController(nibName: "TabBarController", bundle: nil)
                            tabVC.modalPresentationStyle = .fullScreen
                            self.navigationController?.present(tabVC, animated: true, completion: nil)
                        }
                        
                    }
                    else if response == 401 && token == nil{
                        
                        DispatchQueue.main.async {
                            
                            let alert = UIAlertController(title: "Hata", message: "Email veya şifre yanlış", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                
            }else{
                
                let alert = UIAlertController(title: "Hata", message: "Email ve şifre alanı boş bırakılamaz!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
