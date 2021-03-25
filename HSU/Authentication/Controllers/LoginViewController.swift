//
//  LoginViewController.swift
//  HSU
//
//  Created by ezgi on 14.03.2021.
//

import UIKit


@available(iOS 13.0, *)
class LoginViewController: UIViewController {
    
    
    private let emailTxtField:UITextField = {
        let txtField = UITextField()
        
        
        txtField.layer.masksToBounds = false
        txtField.layer.cornerRadius = txtField.frame.size.height / 2
        txtField.layer.shadowOpacity = 0.5
        txtField.layer.shadowRadius = 3.0
        txtField.layer.shadowOffset = CGSize(width: 0, height: 3)
        txtField.layer.shadowColor = UIColor.black.cgColor
            //To apply padding
          let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtField.frame.height))
        txtField.leftView = paddingView
        txtField.leftViewMode = UITextField.ViewMode.always
        txtField.backgroundColor = #colorLiteral(red: 0.9499797225, green: 0.9480717778, blue: 1, alpha: 1)
        txtField.keyboardType = .emailAddress
        txtField.textColor = .black
        txtField.placeholder = "E-mail"
        txtField.font = .systemFont(ofSize: 13)
        txtField.layer.cornerRadius = 6
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    private let passwordTxtField:UITextField = {
        let txtField = UITextField()
        
        txtField.layer.masksToBounds = false
        txtField.layer.cornerRadius = txtField.frame.size.height / 2
        txtField.layer.shadowOpacity = 0.5
        txtField.layer.shadowRadius = 3.0
        txtField.layer.shadowOffset = CGSize(width: 0, height: 3)
        txtField.layer.shadowColor = UIColor.black.cgColor
            //To apply padding
           let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: txtField.frame.height))
        txtField.font = .systemFont(ofSize: 13)
        txtField.leftView = paddingView
        txtField.leftViewMode = UITextField.ViewMode.always
        txtField.backgroundColor = #colorLiteral(red: 0.9499797225, green: 0.9480717778, blue: 1, alpha: 1)
        txtField.keyboardType = .emailAddress
        txtField.textColor = .black
        txtField.placeholder = "Password"
        txtField.layer.cornerRadius = 6
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9843619466, green: 0.777361691, blue: 0.3570454121, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 13
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 3.0
        button.layer.shadowOpacity = 0.5
       
        button.addTarget(self, action: #selector(btnLogin), for: .touchUpInside)
        
        return button
    }()
    
    @objc func btnLogin(sender: UIButton){
        
        print("Ana Sayfa açılacak")
        
        // Temp Auth...
    
        self.navigationController?.present(TabBarController(nibName: "TabBarController", bundle: nil), animated: true, completion: nil)
        
    }
    
    
    lazy var visibleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(changeVisible), for: .touchUpInside)
        return button
    }()
    
    @objc func changeVisible(sender: UIButton){
        
       print("ikon değişecek")
    }
    
    
    private let btnForgotPsw: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Forgot Password!", for: .normal)
        button.addTarget(self, action: #selector(btnForgot), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
        
    }()
    
    @objc func btnForgot(sender: UIButton){
        
       print("forgot password sayfası açılacak")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        loginLoad()
    }
    
   
    func loginLoad() {
        
        
        
        let loginContentView = UIView()
      
        view.addSubview(loginContentView)
      
        
        loginContentView.translatesAutoresizingMaskIntoConstraints = false  
        loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        
        
        
        loginContentView.addSubview(emailTxtField)
      
        emailTxtField.topAnchor.constraint(equalTo:loginContentView.topAnchor, constant:60).isActive = true
        emailTxtField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        emailTxtField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        emailTxtField.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
        
       
        loginContentView.addSubview(passwordTxtField)
      
        passwordTxtField.topAnchor.constraint(equalTo:emailTxtField.bottomAnchor, constant:23).isActive = true
        passwordTxtField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        passwordTxtField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        passwordTxtField.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
        
        
        passwordTxtField.addSubview(visibleButton)
        visibleButton.topAnchor.constraint(equalTo:passwordTxtField.topAnchor, constant:18).isActive = true
        //visibleButton.leftAnchor.constraint(equalTo:passwordTxtField.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        visibleButton.rightAnchor.constraint(equalTo:passwordTxtField.rightAnchor, constant:view.frame.width * -0.034).isActive = true
        visibleButton.heightAnchor.constraint(equalToConstant: 14 ).isActive = true
        visibleButton.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        
        
        loginContentView.addSubview(btnForgotPsw)
        
        btnForgotPsw.topAnchor.constraint(equalTo:passwordTxtField.bottomAnchor, constant:32).isActive = true
        //lblForgotPsw.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.4599900).isActive = true
        btnForgotPsw.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        btnForgotPsw.heightAnchor.constraint(equalToConstant: 14 ).isActive = true
          
          
        loginContentView.addSubview(loginButton)
        
        loginButton.topAnchor.constraint(equalTo:passwordTxtField.topAnchor, constant:162).isActive = true
        loginButton.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        loginButton.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
        
        
        
        
       
        
    }
}
