//
//  ReminderTableViewCell.swift
//  HSU
//
//  Created by ezgi on 22.05.2021.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var rTitleLabel: UILabel!
    @IBOutlet weak var dtitleLabel: UILabel!
    @IBOutlet weak var imgReminder: UIImageView!
    
    @IBOutlet weak var petName: UILabel!
    
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
           
        }
    }
    
  override func awakeFromNib() {
        super.awakeFromNib()
     imageConfiguration()
    configureReminderView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: -Configurations
    
    func imageConfiguration(){
        
        
        imgReminder.layer.cornerRadius = imgReminder.frame.size.height/2
        
    }
    
    func configureReminderView() {

        contentView.layer.cornerRadius = 10
        
        layer.masksToBounds = false
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)

    }
    
}
