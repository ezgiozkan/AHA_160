//
//  AddPetViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 18.03.2021.
//

import UIKit

class AddPetViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var thirdBackView: UIView!
    @IBOutlet weak var fourthBackView: UIView!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var neauteredSwitch: UISwitch!
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let switchColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        configureFirstStackView()
        configureNavBar()
        configureBackViews()
        configureAddButton()
        
    }
    
    func configureFirstStackView() {
        
        self.imageView.image = #imageLiteral(resourceName: "cat3")
        self.imageView.layer.cornerRadius = 75
        self.imageView.layer.masksToBounds = false
        self.imageView.clipsToBounds = true
        
        self.imageButton.layer.cornerRadius = 20
        self.imageButton.addShadow(shadowColor: Constants.Color.shadowColor, radius: 15, opacity: 0.20)

    }
    
    func configureAddButton() {
        
        self.addView.addShadow(shadowColor: Constants.Color.shadowColor, radius: 4, opacity: 0.4)
        self.addButton.layer.cornerRadius = 12
    }
    
    func configureNavBar() {
        
        self.view.backgroundColor = .white
        self.title = "Add pet"
        
        let backBarButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        backBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    

    
    func configureBackViews() {

        self.backView.backViewShadow()
        
        self.nameTextField.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.breedTextField.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.thirdBackView.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.fourthBackView.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        
        // Gender buttons
        self.femaleButton.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        self.femaleButton.addShadow(shadowColor: Constants.Color.shadowColor, radius: 6, opacity: 0.16)
        self.femaleButton.layer.cornerRadius = 5
        
        self.maleButton.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        self.maleButton.addShadow(shadowColor: Constants.Color.shadowColor, radius: 6, opacity: 0.16)
        self.maleButton.layer.cornerRadius = 5
        
        //Switch
        self.neauteredSwitch.tintColor = Constants.Color.switchColor

        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        print("Add pet")
    }
    

    @IBAction func imageButton(_ sender: Any) {
        print("Open gallery...")
    }
    
    
    @IBAction func femaleButton(_ sender: Any) {
        
        print("Male")
    }
    @IBAction func maleButton(_ sender: Any) {
        
        print("Male")
    }
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }
}





