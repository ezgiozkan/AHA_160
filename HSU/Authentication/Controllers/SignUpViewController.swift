//
//  SignUpViewController.swift
//  HSU
//
//  Created by ezgi on 27.03.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmTxtField: UITextField!
    @IBOutlet weak var btnCreateAccount: UIButton!
    
    
    //MARK:CONSTANTS
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let txtBackgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 254 / 255, alpha: 1)
        }
    }

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        configureCreateButton()
    }

    
    func configureCreateButton(){
        
        self.btnCreateAccount.buttonShadow()
        self.btnCreateAccount.layer.cornerRadius = 13
    }
    
    
    
    func configureTextFields(){
        
        
       
        
        self.emailTxtField.layer.cornerRadius = 5
        self.emailTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.emailTxtField.buttonShadow()
        self.emailTxtField.keyboardType = .emailAddress
        
       
        self.passwordTxtField.layer.cornerRadius = 5
        self.passwordTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.passwordTxtField.buttonShadow()
      
        
        self.confirmTxtField.layer.cornerRadius = 5
        self.confirmTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.confirmTxtField.buttonShadow()
    }
    
    
    @IBAction func btnCreateAccount(_ sender: Any) {
        
        print("Create Account")
        
    }
    

   
}
