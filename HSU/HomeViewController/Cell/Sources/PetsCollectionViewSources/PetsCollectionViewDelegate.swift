//
//  PetsCollectionViewDelegate.swift
//  HSU
//
//  Created by Batuhan Baran on 26.03.2021.
//

import Foundation
import UIKit

protocol PetsCollectionViewDelegateOutput: class {
    func didSelect(indexPath: IndexPath)
}

class PetsCollectionViewDelegate: NSObject {
    
    var outputDelegate: PetsCollectionViewDelegateOutput?
    
    init(outputDelegate: PetsCollectionViewDelegateOutput) {
        self.outputDelegate = outputDelegate
    }
}

extension PetsCollectionViewDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 80, height: 80)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.outputDelegate?.didSelect(indexPath: indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 40
        
    }
    
}

