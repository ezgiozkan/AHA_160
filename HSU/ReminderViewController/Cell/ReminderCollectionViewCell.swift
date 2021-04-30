//
//  ReminderCollectionViewCell.swift
//  HSU
//
//  Created by ezgi on 30.04.2021.
//

import UIKit

class ReminderCollectionViewCell: UICollectionViewCell {

    
    static let cellIdentifier = "reminderCollectionViewCell"
       
    // MARK: - IBOutlets
    
       @IBOutlet weak var reminderView: UIView!
       @IBOutlet weak var reminderTitleLabel: UILabel!
       @IBOutlet weak var datetitleLabel: UILabel!
       @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
            static let bottomBorderColor = UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.29)
            static let navBackgroundColor =  UIColor(red: 254 / 255, green: 206 / 255, blue: 95 / 255, alpha: 0.29)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageConfiguration()
        configureReminderView()
    }
    
    // MARK: -Configurations
    
    func imageConfiguration(){
        
        
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        
    }
    
    func configureReminderView() {

        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)

    }

}
