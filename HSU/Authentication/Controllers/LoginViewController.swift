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
    @IBOutlet weak var rememberMeButton: UIButton!
    
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    //MARK:CONSTANTS
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let txtBackgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 254 / 255, alpha: 1)
        }
    }
    
    var isRemember: Bool = false {
        
        didSet {
            
            isRemember ? self.rememberMeButton.setImage(#imageLiteral(resourceName: "checkBoxOn"), for: .normal) : self.rememberMeButton.setImage(#imageLiteral(resourceName: "checkBoxOff"), for: .normal)
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
        txtPaddingVw(txt: self.emailTxtField)
        emailTxtField.tag = 1
        
       
        self.passwordTxtField.layer.cornerRadius = 5
        self.passwordTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.passwordTxtField.buttonShadow()
        self.passwordTxtField.delegate = self
        txtPaddingVw(txt: self.passwordTxtField)
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
        self.title = "Giri?? yap"
        
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setRightBarButton(barButton, animated: true)
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        if let email = emailTxtField.text, let password = passwordTxtField.text{
            
            if !email.isEmpty && !password.isEmpty {
                
                activityIndicator.startAnimating()
                
                Network.shared.signIn(email: self.emailTxtField.text ?? "", password: self.passwordTxtField.text ?? "") { (response,token)  in
                    
                    if response == 200 && token != nil {
                        
                        if self.isRemember {
                            UserDefaults.standard.setValue(token, forKey: "token")

                        }else{
                            
                            if (UserDefaults.standard.string(forKey: "token") != nil) {
                                
                                UserDefaults.standard.setValue(nil, forKey: "token")
                            }
                        }
                        
                        DispatchQueue.main.async {
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.hidesWhenStopped = true
                            let tabVC = TabBarController(nibName: "TabBarController", bundle: nil)
                            tabVC.modalPresentationStyle = .fullScreen
                            self.navigationController?.present(tabVC, animated: true, completion: nil)
                            
                        }
                        
                    }
                    else if response == 401 && token == nil{
                        
                        DispatchQueue.main.async {
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.hidesWhenStopped = true
                            
                            let alert = UIAlertController(title: "Hata", message: "Email veya ??ifre yanl????", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                
            }else{
                
                let alert = UIAlertController(title: "Hata", message: "Email ve ??ifre alan?? bo?? b??rak??lamaz!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    @IBAction func rememberMeButton(_ sender: UIButton) {
        self.isRemember = !self.isRemember
        
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func txtPaddingVw(txt:UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 5))
        txt.leftViewMode = .always
        txt.leftView = paddingView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.emailTxtField.text != "" && self.passwordTxtField.text != ""{
            
            self.navigationController?.popViewController(animated: false)
        }
    }
    
}
