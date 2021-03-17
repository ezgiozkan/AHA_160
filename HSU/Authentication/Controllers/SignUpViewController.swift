//
//  SignUpViewController.swift
//  HSU
//
//  Created by ezgi on 14.03.2021.
//

import UIKit

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    
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
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.layer.cornerRadius = 6
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
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.layer.cornerRadius = 6
        return txtField
    }()
    
    
    private let confirmPasswordTxtField:UITextField = {
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
        txtField.placeholder = "Confirm Password"
        txtField.layer.cornerRadius = 6
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    lazy var signUpButton: UIButton = {
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
       
        button.addTarget(self, action: #selector(btnSignUp), for: .touchUpInside)
        
        return button
    }()
    
    @objc func btnSignUp(sender: UIButton){
        
        print("Ana Sayfa açılacak")
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
        
        print("İkon değişecek")
    }
    
    lazy var confirmVisibleButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .black
      // button.addTarget(self, action: #selector(confirmVisibleButton), for: .touchUpInside)
        return button
    }()
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        loginLoad()
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
        
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
      
        emailTxtField.topAnchor.constraint(equalTo:loginContentView.topAnchor, constant:50).isActive = true
        emailTxtField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        emailTxtField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        emailTxtField.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
        
       
        loginContentView.addSubview(passwordTxtField)
      
        passwordTxtField.topAnchor.constraint(equalTo:emailTxtField.bottomAnchor, constant:25).isActive = true
        passwordTxtField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        passwordTxtField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        passwordTxtField.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
        
        passwordTxtField.addSubview(visibleButton)
        visibleButton.topAnchor.constraint(equalTo:passwordTxtField.topAnchor, constant:18).isActive = true
        //visibleButton.leftAnchor.constraint(equalTo:passwordTxtField.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        visibleButton.rightAnchor.constraint(equalTo:passwordTxtField.rightAnchor, constant:view.frame.width * -0.034).isActive = true
        visibleButton.heightAnchor.constraint(equalToConstant: 14 ).isActive = true
        visibleButton.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        
        
        
         loginContentView.addSubview(confirmPasswordTxtField)
       
        confirmPasswordTxtField.topAnchor.constraint(equalTo:passwordTxtField.bottomAnchor, constant:25).isActive = true
        confirmPasswordTxtField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        confirmPasswordTxtField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        confirmPasswordTxtField.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
         
        
        
        confirmPasswordTxtField.addSubview(confirmVisibleButton)
        confirmVisibleButton.topAnchor.constraint(equalTo:confirmPasswordTxtField.topAnchor, constant:18).isActive = true
        //visibleButton.leftAnchor.constraint(equalTo:passwordTxtField.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        confirmVisibleButton.rightAnchor.constraint(equalTo:confirmPasswordTxtField.rightAnchor, constant:view.frame.width * -0.034).isActive = true
        confirmVisibleButton.heightAnchor.constraint(equalToConstant: 14 ).isActive = true
        confirmVisibleButton.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        

        loginContentView.addSubview(signUpButton)
        
        signUpButton.topAnchor.constraint(equalTo:loginContentView.bottomAnchor, constant:30).isActive = true
        signUpButton.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant:view.frame.width * 0.065).isActive = true
        signUpButton.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant:view.frame.width * -0.065).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 53 ).isActive = true
        
        
        
        
       
        
    }
}
