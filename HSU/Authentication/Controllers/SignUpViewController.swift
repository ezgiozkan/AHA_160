//
//  SignUpViewController.swift
//  HSU
//
//  Created by ezgi on 27.03.2021.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate, UIGestureRecognizerDelegate{

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmTxtField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
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
        configureNavBar()
    }

    
    func configureCreateButton(){
        
        self.signUpButton.backViewShadow(cornerRadius: 8)
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
      
        
        self.confirmTxtField.layer.cornerRadius = 5
        self.confirmTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.confirmTxtField.buttonShadow()
        self.confirmTxtField.delegate = self
        confirmTxtField.tag = 3
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
        self.title = "Üye ol"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    @IBAction func btnCreateAccount(_ sender: Any) {
        
        let tabVC = TabBarController(nibName: "TabBarController", bundle: nil)
        tabVC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(tabVC, animated: true, completion: nil)
        
    }
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
