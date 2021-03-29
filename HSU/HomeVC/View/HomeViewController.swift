//
//  HomeViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 12.03.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var petsCollectionView: UICollectionView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    var petsCollectionViewDataSource: PetsCollectionViewDataSource?
    var servicesCollectionViewDataSource: ServicesCollectionViewDataSource?
    
    var petsCollectionViewDelegate: PetsCollectionViewDelegate?
    var servicesCollectionViewDelegate: ServicesCollectionViewDelegate?
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let borderColor = UIColor(red: 254 / 255, green: 203 / 255, blue: 85 / 255, alpha: 1.0)
        }
    }
    
    // MARK: - Collection View Type
    enum CollectionViewType{

        case forPets
        case forServices
    }
    
    var windowWidth: CGFloat?{
        
        return UIScreen.main.bounds.width - 25
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureImageView()
        configureCollectionViews()
        
    }
    
    
    func configureImageView() {
        
        imageView.image = #imageLiteral(resourceName: "face")
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = Constants.Color.borderColor.cgColor
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    func configureCollectionViews() {
        
        self.petsCollectionViewDelegate = PetsCollectionViewDelegate(outputDelegate: self)
        self.petsCollectionViewDataSource = PetsCollectionViewDataSource()
        
        self.petsCollectionView.dataSource = self.petsCollectionViewDataSource
        self.petsCollectionView.delegate = self.petsCollectionViewDelegate
        
        self.petsCollectionView.register(UINib(nibName: "PetsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PetsCollectionViewCell.cellIdentifier)
        
       
        self.servicesCollectionViewDataSource = ServicesCollectionViewDataSource()
        self.servicesCollectionViewDelegate = ServicesCollectionViewDelegate(width: self.windowWidth ?? 0.0)
        
        self.servicesCollectionView.dataSource = self.servicesCollectionViewDataSource
        self.servicesCollectionView.delegate = self.servicesCollectionViewDelegate
        
        self.servicesCollectionView.register(UINib(nibName: "ServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ServicesCollectionViewCell.cellIdentifier)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    

}


extension HomeViewController: PetsCollectionViewDelegateOutput {
    func didSelect(indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            self.navigationController?.pushViewController(AddPetViewController(nibName: "AddPetViewController", bundle: nil), animated: true)
        }else{
            
            self.navigationController?.pushViewController(PetDetailViewController(nibName: "PetDetailViewController", bundle: nil), animated: true)
        }
    }
}

