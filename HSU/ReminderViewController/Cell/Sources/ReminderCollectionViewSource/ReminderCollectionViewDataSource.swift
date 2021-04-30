//
//  ReminderCollectionViewDataSource.swift
//  HSU
//
//  Created by ezgi on 30.04.2021.
//

import Foundation
import UIKit


class ReminderCollectionViewDataSource: NSObject {
    
}

extension ReminderCollectionViewDataSource: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReminderCollectionViewCell.cellIdentifier, for: indexPath) as! ReminderCollectionViewCell
        
        cell.reminderTitleLabel.text = "Food poisoning Meds"
        cell.datetitleLabel.text = "25th April, 10 AM"
        cell.imageView.image = #imageLiteral(resourceName: "foodImg")
        
        return cell
        
    }
}
