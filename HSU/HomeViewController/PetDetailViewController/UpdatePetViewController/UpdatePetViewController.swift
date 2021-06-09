//
//  UpdatePetViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 25.04.2021.
//

import UIKit

class UpdatePetViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var neauteredSwitch: UISwitch!
    
    var willUpdatePet: Pets?
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let switchColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
            static let genderButtonColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1.0)
        }
    }

    let datePicker = UIDatePicker()
    
     init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, willUpdatePet: Pets) {
        super.init(nibName: "UpdatePetViewController", bundle: nil)
        
        self.willUpdatePet = willUpdatePet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureBackViews()
        configureAddButton()
        setWillUpdatePet()
        
    }
    
    func setWillUpdatePet() {
        
        self.nameTextField.text = self.willUpdatePet?.name
        
        if self.willUpdatePet?.isNeutered ?? false{
            self.neauteredSwitch.isOn = true
        }else{
            self.neauteredSwitch.isOn = false
        }
    }

    func configureAddButton() {
        self.addView.addShadow(shadowColor: Constants.Color.shadowColor, radius: 4, opacity: 0.4)
        self.updateButton.layer.cornerRadius = 12
    }
    
    func configureNavBar() {
        
        self.view.backgroundColor = .white
        self.title = "Evcil hayvan güncelle"
        
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
        //Switch
        self.neauteredSwitch.tintColor = Constants.Color.switchColor

        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }


    @IBAction func imageButton(_ sender: Any) {
    }

    @IBAction func updateButton(_ sender: Any) {
        if let name = self.nameTextField.text {
            if !name.isEmpty{
                
                let params = [
                    "id": willUpdatePet?.id ?? 0,
                    "name": name,
                    "isNeutered": neauteredSwitch.isOn ? true : false
                ]
                as [String : Any]
                
                Network.shared.updatePet(animalId:willUpdatePet?.id ?? 0, params: params) { (status, response) in
                    
                    if status == 200 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "", message: "Tebrikler " + "\(self.willUpdatePet!.name)" + " isimli evcil hayvanın bilgileri başarılı bir şekilde güncellendi!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
                                self.navigationController?.popToRootViewController(animated: true)
                            }))
                            self.present(alert, animated: true, completion: nil)
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
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
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





