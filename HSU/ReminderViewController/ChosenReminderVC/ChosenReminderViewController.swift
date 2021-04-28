//
//  ChosenReminderViewController.swift
//  HSU
//
//  Created by ezgi on 27.04.2021.
//
import UIKit

public class ChosenReminderViewController: UIViewController, UIGestureRecognizerDelegate {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var additionalNoteView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var reminderNameTextField: UITextField!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var repeatView: UIView!
    @IBOutlet weak var selectPetView: UIView!
    
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

        configureViews()
        configureAddButton()
        configureNavBar()
    }

    // MARK: - Configures
    
    func configureViews(){
        
        self.reminderView.backViewShadow(cornerRadius: 24)
        self.additionalNoteView.backViewShadow(cornerRadius: 24)
        self.reminderView.layer.cornerRadius = 10
        self.additionalNoteView.layer.cornerRadius = 10
        
        self.reminderNameTextField.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.dateView.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
        self.repeatView.addBottomBorder(height: 0.6, color: Constants.Color.bottomBorderColor)
      
    }
    
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
    
    
    
}
