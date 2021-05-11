//
//  HealthInformationCollectionViewCell.swift
//  HSU
//
//  Created by Batuhan Baran on 7.05.2021.
//

import UIKit

class HealthInformationCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "HealthInformationCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureBackView()
    }
    
    func configureBackView() {

        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 8
        layer.masksToBounds = false
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)

    }

}
