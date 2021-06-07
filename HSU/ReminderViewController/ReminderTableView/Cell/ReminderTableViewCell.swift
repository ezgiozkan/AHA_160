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
    @IBOutlet weak var backView: UIView!
    
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.8)
           
        }
    }
    
  override func awakeFromNib() {
        super.awakeFromNib()
     imageConfiguration()
    configureBackView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: -Configurations
    
    func imageConfiguration(){
        
        
        imgReminder.layer.cornerRadius = imgReminder.frame.size.height/2
        
    }
    
    func configureBackView() {

        backView.layer.cornerRadius = 8
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 8
        backView.layer.masksToBounds = false
        backView.layer.shadowRadius = 8.0
        backView.layer.shadowOpacity = 0.20
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 0, height: 5)

    }
    
}
