//
//  ChosenReminderViewController.swift
//  HSU
//
//  Created by ezgi on 27.04.2021.
//
import UIKit

public class ChosenReminderViewController: UIViewController, UIGestureRecognizerDelegate {

    
    // MARK: - IBOutlets
    
   // @IBOutlet weak var reminderView: UIView!
    // @IBOutlet weak var additionalNoteView: UIView!
     @IBOutlet weak var addBtn: UIButton!
    // @IBOutlet weak var reminderNameTextField: UITextField!
    // @IBOutlet weak var dateView: UIView!
    // @IBOutlet weak var repeatView: UIView!
    // @IBOutlet weak var selectPetView: UIView!
    @IBOutlet weak var birthTextField: UITextField!
    
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
    }

    let datePicker = UIDatePicker()
    
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
        
        print("Add")
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        self.tabBarController?.tabBar.isHidden = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.tabBarController?.tabBar.isHidden = false
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
    
    @objc func doneButtonClicked() {
           
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthTextField.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
}