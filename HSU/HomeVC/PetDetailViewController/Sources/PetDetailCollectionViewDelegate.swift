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
        
        return CGSize(width: self.cellWidth, height: 55)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
        
    }
    
    
}

