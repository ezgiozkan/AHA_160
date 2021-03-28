//
//  PetDetailViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 28.03.2021.
//

import UIKit

class PetDetailViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureNavBar()
    }

    func configureNavBar() {
        
        let backBarButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        backBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }

}
