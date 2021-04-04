//
//  PetDetailReusableViewCell.swift
//  HSU
//
//  Created by Batuhan Baran on 3.04.2021.
//

import UIKit

class PetDetailReusableViewCell: UICollectionViewCell {
    
    static let footerReuseIdentifier = "petDetailReusableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
   
        configureBackView()
        
    }
    
    func configureBackView() {

        contentView.layer.cornerRadius = 24
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 24
        layer.masksToBounds = false
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)

    }

}
