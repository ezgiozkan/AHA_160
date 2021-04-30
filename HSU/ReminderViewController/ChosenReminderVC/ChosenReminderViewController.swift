//
//  ChosenReminderViewController.swift
//  HSU
//
//  Created by ezgi on 27.04.2021.
//
import UIKit

public class ChosenReminderViewController: UIViewController, UIGestureRecognizerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    
    // MARK: - IBOutlets
    
   // @IBOutlet weak var reminderView: UIView!
    // @IBOutlet weak var additionalNoteView: UIView!
     @IBOutlet weak var addBtn: UIButton!
    // @IBOutlet weak var reminderNameTextField: UITextField!
    // @IBOutlet weak var dateView: UIView!
    // @IBOutlet weak var repeatView: UIView!
    // @IBOutlet weak var selectPetView: UIView!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var petNameTextField: UITextField!
    
    var reminderPickerView : UIPickerView!
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
            static let navBackgroundColor =  UIColor(red: 254 / 255, green: 206 / 255, blue: 95 / 255, alpha: 0.29)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

       // configureViews()
        configureAddButton()
        configureNavBar()
        createDatePicker()
        pickUp(typeTextField)
    }

    let datePicker = UIDatePicker()
    let typeReminder = ["Vaccine", "Vet Visit", "Food"]
    
    // MARK: - Configures
    
    /*func configureViews(){
        
        self.reminderView.backViewShadow(cornerRadius: 24)
        self.additionalNoteView.backViewShadow(cornerRadius: 24)
        self.reminderView.layer.cornerRadius = 10
        self.additionalNoteView.layer.cornerRadius = 10
        
        self.reminderNameTextField.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.dateView.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.repeatView.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
      
    }*/
    
    func configureAddButton(){
        self.addBtn.addShadow(shadowColor: Constants.Color.shadowColor, radius: 4, opacity: 0.4)
        self.addBtn.layer.cornerRadius = 12
        
    }
    
    func configureNavBar() {
        
        
        self.view.backgroundColor = .white
        //self.title = "Add pet"
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    
        
    }
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
        if typeTextField.text == "" || birthTextField.text == "" || petNameTextField.text == ""
        {
            let alertController = UIAlertController(title: "", message: "Lütfen bütün alanları doldurunuz", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "", style: .default, handler: nil)
            alertController.addAction(alertAction)
            
            present(alertController,animated: true,completion: nil)
            return
        }
        dismiss(animated: true, completion: nil)
        
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        self.tabBarController?.tabBar.isHidden = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    //MARK: Date Picker
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
    
    @objc func doneButtonClicked() {
           
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthTextField.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    
    //MARK: Type Reminder
    
    func pickUp(_ textField : UITextField){
        
        // UIPickerView
        self.reminderPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.reminderPickerView.delegate = self
        self.reminderPickerView.dataSource = self
        self.reminderPickerView.backgroundColor = UIColor.white
        textField.inputView = self.reminderPickerView
        
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
        self.typeTextField.text = typeReminder[row]
    }
    //MARK:- TextFiled Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(typeTextField)
    }
    
    //MARK:- Button
    @objc func doneClick() {
        typeTextField.resignFirstResponder()
    }
   
    
}
