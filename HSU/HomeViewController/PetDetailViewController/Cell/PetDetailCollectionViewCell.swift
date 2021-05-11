//
//  PetDetailCollectionViewCell.swift
//  HSU
//
//  Created by Batuhan Baran on 3.04.2021.
//

import UIKit

class PetDetailCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "petDetailCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    // MARK: - Constants
    private enum Constants{
        
        enum Color{
            
            static let shadowColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.16)

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
   
        //configureBackView()
        
    }
    
    func configureBackView() {

        layer.shadowRadius = 4.0
        layer.shadowOpacity = 1
        layer.shadowColor = Constants.Color.shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        contentView.layer.cornerRadius = self.frame.height / 2.0
        contentView.layer.masksToBounds = true

    }

}
