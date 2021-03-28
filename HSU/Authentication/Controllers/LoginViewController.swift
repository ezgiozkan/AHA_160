//
//  LoginViewController.swift
//  HSU
//
//  Created by ezgi on 14.03.2021.
//

import UIKit


@available(iOS 13.0, *)
class LoginViewController: UIViewController {

    //MARK:IBOutlets
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
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
       
     
    }
    
    func configureLoginButton(){
        
        self.loginBtn.buttonShadow()
        self.loginBtn.layer.cornerRadius = 13
    }
    
    func configureTextFields(){
        
        self.emailTxtField.layer.cornerRadius = 5
        self.emailTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.emailTxtField.buttonShadow()
        self.emailTxtField.keyboardType = .emailAddress
        
       
        self.passwordTxtField.layer.cornerRadius = 5
        self.passwordTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.passwordTxtField.buttonShadow()
    }
    
    
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        print("forgot password")
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        
        self.navigationController?.pushViewController(HomeViewController(nibName: "HomeViewController", bundle: nil), animated: true)
        
    }
    
    
}
