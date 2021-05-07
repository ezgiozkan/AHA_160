//
//  HealthInformationViewController.swift
//  HSU
//
//  Created by Batuhan Baran on 7.05.2021.
//

import UIKit

class HealthInformationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureNavBar()
    }
    
    func configureCollectionView() {
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "HealthInformationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HealthInformationCollectionViewCell.cellIdentifier)
        
    }
    
    func configureNavBar() {
        
        self.navigationController?.navigationBar.topItem?.title = "Sağlık Bilgileri"
    }

}

extension HealthInformationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HealthInformationCollectionViewCell.cellIdentifier, for: indexPath) as? HealthInformationCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize.init(width: UIScreen.main.bounds.width - 11, height: 313.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           
        return UIEdgeInsets(top: 11, left: 11, bottom: 0, right: 11)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 25
    }
}
