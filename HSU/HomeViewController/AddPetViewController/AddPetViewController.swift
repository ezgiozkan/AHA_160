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
    @IBOutlet weak var birthTextField: UITextField!
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let switchColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
            static let genderButtonColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1.0)
        }
    }
    
    var selectedGender: String = "Dişi" {
        
        didSet {
            
            if selectedGender == "Erkek" {
                
                self.maleButton.setTitleColor(.white, for: .normal)
                self.maleButton.backgroundColor = Constants.Color.genderButtonColor
                
                self.femaleButton.setTitleColor(.black, for: .normal)
                self.femaleButton.backgroundColor = .white
            
            }else{
                
                self.maleButton.setTitleColor(.black, for: .normal)
                self.maleButton.backgroundColor = .white
                
                self.femaleButton.setTitleColor(.white, for: .normal)
                self.femaleButton.backgroundColor = Constants.Color.genderButtonColor
            }
        }
        
    }
    
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDatePicker()
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
        self.title = "Evcil hayvan ekle"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }

    
    func configureBackViews() {

        self.backView.backViewShadow(cornerRadius: 24)
        
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
    
    func createDatePicker() {
            
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolBar.setItems([doneButton], animated: true)
        
        
        birthTextField.inputAccessoryView = toolBar
        birthTextField.inputView = datePicker
        
        datePicker.datePickerMode = .date

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
       
        }
    }

    @IBAction func addButton(_ sender: Any) {
        
        print("Add pet")
    }
    

    @IBAction func imageButton(_ sender: Any) {
        print("Open gallery...")
    }
    
    
    @IBAction func femaleButton(_ sender: UIButton) {

        self.selectedGender = sender.currentTitle!
        print(self.selectedGender)
    }
    
    @IBAction func maleButton(_ sender: UIButton) {
        
        self.selectedGender = sender.currentTitle!
        print(self.selectedGender)
    }
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonClicked() {
           
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthTextField.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.tabBarController?.tabBar.isHidden = false
    }
}





