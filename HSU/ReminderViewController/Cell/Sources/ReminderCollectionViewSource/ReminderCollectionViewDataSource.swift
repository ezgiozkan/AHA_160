//
//  ReminderCollectionViewDataSource.swift
//  HSU
//
//  Created by ezgi on 30.04.2021.
//

import Foundation
import UIKit
import CoreData

var reminderList : [Reminder]?



class ReminderCollectionViewDataSource: NSObject {
    
    
}

extension ReminderCollectionViewDataSource: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if reminderList != nil {
            return reminderList!.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReminderCollectionViewCell.cellIdentifier, for: indexPath) as! ReminderCollectionViewCell
        
        cell.reminderTitleLabel.text = reminderList![indexPath.row].reminderType
        cell.datetitleLabel.text = reminderList![indexPath.row].reminderDate
        cell.imageView.image = #imageLiteral(resourceName: "foodImg")
        
        return cell
        
    }
    
    func getAllReminder(){
        
        let fetchRequest : NSFetchRequest<Reminder> = Reminder.fetchRequest()
        
        do{
        
            reminderList = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
           
        }
        catch{
            
        }
    }
}
