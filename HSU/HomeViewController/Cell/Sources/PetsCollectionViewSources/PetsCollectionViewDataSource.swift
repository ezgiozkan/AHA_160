//
//  PetsCollectionViewDataSource.swift
//  HSU
//
//  Created by Batuhan Baran on 26.03.2021.
//

import Foundation
import UIKit

class PetsCollectionViewDataSource: NSObject {
    
    let viewModel: PetsCollectionViewModel?
    
    init(viewModel: PetsCollectionViewModel) {
        
        self.viewModel = viewModel
    }
    
}

extension PetsCollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.cellIdentifier, for: indexPath) as! PetsCollectionViewCell
        
        if indexPath.row == 0{
            
            cell.imageView.image = #imageLiteral(resourceName: "plus")
            
        }else{
            if viewModel?.cellForItemAt(indexPath: indexPath.row)?.type == "Kedi"
            {
                cell.imageView.image = UIImage(named: "catImg")
            }
            else if viewModel?.cellForItemAt(indexPath: indexPath.row)?.type == "Köpek"
            {
                cell.imageView.image = UIImage(named: "dogImg")
            }
            
            
           
        }
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.numberOfItemsInSection() ?? 0 + 1
 
    }
    
    
}
