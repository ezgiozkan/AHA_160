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
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
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
    
    let userId = UserDefaults.standard.integer(forKey: "currentUserId")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchUserInfo()
        configureTextFields()
        configureUpdateButton()
        configureNavBar()
    }
    
    func fetchUserInfo() {
        Network.shared.getUserInfo { (result) in
            switch result {
            case .success(let user):
                print(user)
                DispatchQueue.main.async {
                    self.phoneNumberTxtField.text = user.phoneNumber
                    self.emailTxtField.text = user.email
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
       

    }
    
    func configureUpdateButton() {
        self.addView.addShadow(shadowColor: Constants.Color.shadowColor, radius: 4, opacity: 0.4)
        self.updateButton.layer.cornerRadius = 12
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
    
    @IBAction func updateButton(_ sender: Any) {
        
        if let phoneNumber = phoneNumberTxtField.text,let email = emailTxtField.text {
            if !phoneNumber.isEmpty && !email.isEmpty {
                let params = [
                    "id": self.userId,
                    "phonenumber": phoneNumber,
                    "email": email
                ]
                as [String : Any]
                Network.shared.updateUserInfo(params: params) { (statusCode, error) in
                    if statusCode == 200 {
                        UserDefaults.standard.removeObject(forKey: "currentUserEmail")
                        UserDefaults.standard.setValue(email, forKey: "currentUserEmail")
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "", message: "Bilgileriniz  başarılı  bir şekilde  güncellendi. Lüfen tekrar giriş yapın!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                                UserDefaults.standard.removeObject(forKey: "token")
                                
                                let rootViewController = RootViewController(nibName: "RootViewController", bundle: .main)
                                let rootNavigationController = UINavigationController(rootViewController: rootViewController)
                                rootNavigationController.modalPresentationStyle = .fullScreen
                                
                                self.present(rootNavigationController, animated: true, completion: nil)
                            }))
                            
                            self.present(alert, animated: true, completion: nil)
                        }
                    }else{
                        let alert = UIAlertController(title: "Hata", message: "Bir hata oluştu lütften daha sonra tekrar deneyin!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                            self.navigationController?.popViewController(animated: true)
                        }))
                    }
                }
            }else{
                let alert = UIAlertController(title: "Hata", message: "Email ve telefon numarası boş bırakılamaz!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                    self.fetchUserInfo()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
