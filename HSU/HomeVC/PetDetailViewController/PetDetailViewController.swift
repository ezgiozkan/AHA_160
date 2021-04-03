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
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    
    var petDetailCollectionViewDataSource: PetDetailCollectionViewDataSource?
    var petDetailCollectionViewDelegate: PetDetailCollectionViewDelegate?
    
    var windowWidth: CGFloat?{
        
        return UIScreen.main.bounds.width - 25
    }
    
    var windowHeight: CGFloat?{
        
        return UIScreen.main.bounds.height - 250
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
        configureCollectionView()
    }

    func configureNavBar() {
        
        self.title = "Pablo"
        
        let backBarButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        backBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    func configureCollectionView() {
        
        self.viewHeight.constant = self.windowHeight ?? 0.0
        
        (self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout).footerReferenceSize = CGSize(width: self.windowWidth ?? 0.0, height: 80)
        
        self.petDetailCollectionViewDataSource = PetDetailCollectionViewDataSource()
        self.petDetailCollectionViewDelegate = PetDetailCollectionViewDelegate(width: self.windowWidth ?? 0.0)
        
        self.collectionView.dataSource = self.petDetailCollectionViewDataSource
        self.collectionView.delegate = self.petDetailCollectionViewDelegate
        
        self.collectionView.register(UINib(nibName: "PetDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PetDetailCollectionViewCell.cellIdentifier)
        self.collectionView.register(UINib(nibName: "PetDetailReusableViewCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PetDetailReusableViewCell.footerReuseIdentifier)
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
    
    @objc func back() {
        
        self.navigationController?.popViewController(animated: true)
    }

}
