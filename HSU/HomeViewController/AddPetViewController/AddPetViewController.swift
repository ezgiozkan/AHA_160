//
//  AddPetViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 18.03.2021.
//

import UIKit

protocol AddPetOutputDelegate: class {
    
    func petIds(id: Int)
}

enum PetType : String {
    case cat = "catImg"
    case dog = "dogImg"
}

class AddPetViewController: UIViewController, UIGestureRecognizerDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    @IBOutlet weak var petTypeTextField: UITextField!
    
    var petTypePickerView = UIPickerView()
    let typeReminder = ["Kedi", "Köpek", "Kuş", "Diğer"]
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let switchColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
            static let genderButtonColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1.0)
        }
    }
    
    var selectedGender: String? = "Dişi" {
        
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
    
    var petIds: [String] = []
    
    var outputDelegate: AddPetOutputDelegate?
    
    var dateOfBirth: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        configureFirstStackView()
        configureNavBar()
        configureBackViews()
        configureAddButton()
        pickUp(petTypeTextField)
        
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
        
        if let name = self.nameTextField.text, let gender = self.selectedGender,
           let breed = self.breedTextField.text,
           let petType = self.petTypeTextField.text,
           let userId = UserDefaults.standard.string(forKey: "currentUserId") {
            
            if !name.isEmpty && !gender.isEmpty && !breed.isEmpty && !dateOfBirth.isEmpty && !userId.isEmpty && !petType.isEmpty {
                
                let params = [
                    "userId": userId,
                    "name": name,
                    "gender": gender,
                    "type": petType,
                    "breed": breed,
                    "dateOfBirth": self.dateOfBirth,
                    "isneutered": neauteredSwitch.isOn ? true : false
                ]
                as [String : Any]
                
                Network.shared.addPet(params: params) { (status, response) in
                    
                    if status == 200 {
                        
                        self.outputDelegate?.petIds(id: response?.id ?? 0)
                        
                        DispatchQueue.main.async {
                            
                            self.navigationController?.popViewController(animated: true)
                        }
                        
                    }else{
                        
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Hata!", message: "Bir hata oluştu lütfen daha sonra tekrar deneyin.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                                self.navigationController?.popViewController(animated: true)
                            }))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            }else{
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Hata!", message: "Lütfen tüm alanları doldurduğunuzdan emin olun.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    

    @IBAction func imageButton(_ sender: Any) {
    }
    
    
    @IBAction func femaleButton(_ sender: UIButton) {
        self.selectedGender = sender.currentTitle!
    }
    
    @IBAction func maleButton(_ sender: UIButton) {
        self.selectedGender = sender.currentTitle!
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonClicked() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.dateOfBirth = dateFormatter.string(from: datePicker.date)
        birthTextField.text = String(dateFormatter.string(from: datePicker.date).split(separator: "T").first ?? "").replacingOccurrences(of: "-", with: "/")
        
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
    
    //MARK: Type Reminder
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.petTypePickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.petTypePickerView.delegate = self
        self.petTypePickerView.dataSource = self
        self.petTypePickerView.backgroundColor = UIColor.white
        textField.inputView = self.petTypePickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneClick))
       
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
        
    }
    //MARK:- PickerView Delegate & DataSource
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeReminder.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeReminder[row]
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.petTypeTextField.text = typeReminder[row]
    }
    //MARK:- TextFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(petTypeTextField)
    }
    
    //MARK:- Button
    @objc func doneClick() {
        petTypeTextField.resignFirstResponder()
        
        if self.petTypeTextField.text == "Kedi" {
            imageView.image = UIImage(named: "catImg")
        }
        else if self.petTypeTextField.text == "Köpek" {
            imageView.image = UIImage(named: "dogImg")
        }
        else if self.petTypeTextField.text == "Kuş"
        {
            imageView.image = UIImage(named: "bird")
        }
        else
        {
            imageView.image = UIImage(named: "other")
        }
    }
   
    
    
    
    
    
    
    
    
    
    
    
}





