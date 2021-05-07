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
        
        self.backView.backViewShadow(cornerRadius: 5)
    }

}
