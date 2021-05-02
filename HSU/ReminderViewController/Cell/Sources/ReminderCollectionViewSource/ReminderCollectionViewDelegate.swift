//
//  ReminderCollectionViewDelegate.swift
//  HSU
//
//  Created by ezgi on 30.04.2021.
//

import Foundation
import UIKit

class ReminderCollectionViewDelegate: NSObject {
    
    var cellWidth: CGFloat = 0.0
    
    init(width: CGFloat) {
        
        self.cellWidth = width
    }
}

extension ReminderCollectionViewDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.cellWidth, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        
        return 20
        
    }
    
}
