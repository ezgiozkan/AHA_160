//
//  SignUpViewController.swift
//  HSU
//
//  Created by ezgi on 27.03.2021.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate, UIGestureRecognizerDelegate{

    // MARK: - IBOutlets
    
    @IBOutlet weak var fullNameTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
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
        
        self.fullNameTxtField.layer.cornerRadius = 5
        self.fullNameTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.fullNameTxtField.buttonShadow()
        self.fullNameTxtField.keyboardType = .emailAddress
        self.fullNameTxtField.delegate = self
        txtPaddingVw(txt: self.fullNameTxtField)
        fullNameTxtField.tag = 1
        
        self.phoneNumberTxtField.layer.cornerRadius = 5
        self.phoneNumberTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.phoneNumberTxtField.buttonShadow()
        self.phoneNumberTxtField.keyboardType = .emailAddress
        self.phoneNumberTxtField.delegate = self
        txtPaddingVw(txt: self.phoneNumberTxtField)
        phoneNumberTxtField.tag = 2
        
        self.emailTxtField.layer.cornerRadius = 5
        self.emailTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.emailTxtField.buttonShadow()
        self.emailTxtField.keyboardType = .emailAddress
        self.emailTxtField.delegate = self
        txtPaddingVw(txt: self.emailTxtField)
        emailTxtField.tag = 3
       
        self.passwordTxtField.layer.cornerRadius = 5
        self.passwordTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.passwordTxtField.buttonShadow()
        self.passwordTxtField.delegate = self
        txtPaddingVw(txt: self.passwordTxtField)
        passwordTxtField.tag = 4
      
        
        self.confirmTxtField.layer.cornerRadius = 5
        self.confirmTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.confirmTxtField.buttonShadow()
        self.confirmTxtField.delegate = self
        txtPaddingVw(txt: self.confirmTxtField)
        confirmTxtField.tag = 5
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
        
        if let fullName = fullNameTxtField.text, let phoneNumber = phoneNumberTxtField.text,
           let email = emailTxtField.text, let password = passwordTxtField.text,
           let confirmPassword = confirmTxtField.text {
            
            if !fullName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty {
                
                if password == confirmPassword {
                    
                    Network.shared.signUp(fullName: fullName, phoneNumber: phoneNumber, email: email, password: password) { (statusCode, error) in
                        
                        if statusCode == 201 && error == nil {
                            
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: "", message: "Üye kayıtı başarılı.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                                    
                                    let loginVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
                                    loginVC.modalPresentationStyle = .fullScreen
                                    self.navigationController?.pushViewController(loginVC, animated: true)
                                }))
                                
                                self.present(alert, animated: true, completion: nil)

                            }
                            
                        }else{
                            
                            print("register failure")
                        }
                    }
                    
                }else{
                    
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: "Hata", message: "Şifreler aynı değil lütfen kontrol ediniz!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }else{
                
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Hata", message: "Bütün alanları doldurduğunuzdan emin olun!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
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
