//
//  PetDetailViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 28.03.2021.
//

import UIKit

class PetDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var firstBackView: UIView!
    @IBOutlet private weak var secondBackView: UIView!
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let switchColor = UIColor(red: 157 / 255, green: 155 / 255, blue: 240 / 255, alpha: 1)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
        }
    }
    
    var petDetailCollectionViewDataSource: PetDetailCollectionViewDataSource?
    var petDetailCollectionViewDelegate: PetDetailCollectionViewDelegate?
    
    var windowWidth: CGFloat{
        
        return UIScreen.main.bounds.width - 80
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
        configureCollectionView()
    }

    func configureNavBar() {
        
        let backBarButton = UIBarButtonItem(image: UIImage(named: "backBarButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        navigationItem.leftBarButtonItem = backBarButton

        
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "deleteButton"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(deletePet))
        navigationItem.rightBarButtonItem = rightBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    
    func configureCollectionView() {
    
        self.firstBackView.backViewShadow(cornerRadius: 24)
        self.secondBackView.backViewShadow(cornerRadius: 24)
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.petDetailCollectionViewDataSource = PetDetailCollectionViewDataSource()
        self.petDetailCollectionViewDelegate = PetDetailCollectionViewDelegate(width: self.windowWidth)
        
        self.collectionView.dataSource = self.petDetailCollectionViewDataSource
        self.collectionView.delegate = self.petDetailCollectionViewDelegate
        
        self.collectionView.register(UINib(nibName: "PetDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PetDetailCollectionViewCell.cellIdentifier)

    }
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func deletePet() {
        
        print("delete")
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        self.navigationController?.pushViewController(UpdatePetViewController(nibName: "UpdatePetViewController", bundle: nil), animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = true
        self.tabBarController?.tabBar.isHidden = false
    }

}
