//
//  PetDetailCollectionViewDelegate.swift
//  HSU
//
//  Created by Batuhan Baran on 3.04.2021.
//

import Foundation
import UIKit

class PetDetailCollectionViewDelegate: NSObject {
    
    var cellWidth: CGFloat = 0.0
    
    init(width: CGFloat) {
        
        self.cellWidth = width
    }
}

extension PetDetailCollectionViewDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.cellWidth, height: 60)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 35, right: 5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    
}

