//
//  ServicesCollectionViewDataSource.swift
//  HSU
//
//  Created by Batuhan Baran on 26.03.2021.
//

import Foundation
import UIKit

class ServicesCollectionViewDataSource: NSObject {
    
}

extension ServicesCollectionViewDataSource: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.cellIdentifier, for: indexPath) as! ServicesCollectionViewCell
        
        cell.titleLabel.text = "Name"
        cell.subtitleLabel.text = "Description"
        cell.imageView.image = #imageLiteral(resourceName: "face")
        
        return cell
        
    }
}



