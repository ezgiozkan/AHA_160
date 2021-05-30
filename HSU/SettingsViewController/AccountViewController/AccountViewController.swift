//
//  AccountViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 26.05.2021.
//

import UIKit

class AccountViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var scrollViewContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let switchColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
            static let genderButtonColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1.0)
            static let txtBackgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 254 / 255, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        configureUpdateButton()
        configureNavBar()
    }
    
    func configureTextFields(){
            
        self.phoneNumberTxtField.layer.cornerRadius = 5
        self.phoneNumberTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.phoneNumberTxtField.buttonShadow()
        self.phoneNumberTxtField.keyboardType = .emailAddress
        txtPaddingVw(txt: self.phoneNumberTxtField)

        
        self.emailTxtField.layer.cornerRadius = 5
        self.emailTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.emailTxtField.buttonShadow()
        self.emailTxtField.keyboardType = .emailAddress
        txtPaddingVw(txt: self.emailTxtField)
       
        self.passwordTxtField.layer.cornerRadius = 5
        self.passwordTxtField.backgroundColor = Constants.Color.txtBackgroundColor
        self.passwordTxtField.buttonShadow()
        txtPaddingVw(txt: self.passwordTxtField)

    }
    
    func configureUpdateButton() {
        self.addView.addShadow(shadowColor: Constants.Color.shadowColor, radius: 4, opacity: 0.4)
        self.addButton.layer.cornerRadius = 12
    }
    
    func configureNavBar() {
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    func txtPaddingVw(txt:UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 5))
        txt.leftViewMode = .always
        txt.leftView = paddingView
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
