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
        
        let backBarButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(back))
        backBarButton.tintColor = .black
        navigationItem.leftBarButtonItem = backBarButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    
    func configureCollectionView() {
    
        self.firstBackView.backViewShadow()
        self.secondBackView.backViewShadow()
        
        self.petDetailCollectionViewDataSource = PetDetailCollectionViewDataSource()
        self.petDetailCollectionViewDelegate = PetDetailCollectionViewDelegate(width: self.windowWidth)
        
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
extension UICollectionView {
func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
let mask = CAShapeLayer()
mask.path = path.cgPath
self.layer.mask = mask
}}


