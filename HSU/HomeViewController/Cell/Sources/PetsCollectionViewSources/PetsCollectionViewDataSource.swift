//
//  PetsCollectionViewDataSource.swift
//  HSU
//
//  Created by Batuhan Baran on 26.03.2021.
//

import Foundation
import UIKit

class PetsCollectionViewDataSource: NSObject {
    
    
}

extension PetsCollectionViewDataSource: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.cellIdentifier, for: indexPath) as! PetsCollectionViewCell
        
        if indexPath.row != 0{
            
            cell.imageView.image = #imageLiteral(resourceName: "cat3")
            
        }else{
            
            cell.imageView.image = #imageLiteral(resourceName: "plus")
        }
        
        return cell
    }
    
}
