//
//  PetDetailCollectionViewDataSource.swift
//  HSU
//
//  Created by Batuhan Baran on 3.04.2021.
//

import Foundation
import UIKit

class PetDetailCollectionViewDataSource: NSObject {
    
}

extension PetDetailCollectionViewDataSource: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetDetailCollectionViewCell.cellIdentifier, for: indexPath) as! PetDetailCollectionViewCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PetDetailReusableViewCell.footerReuseIdentifier, for: indexPath)
        
        return view
    }
    
    
}
