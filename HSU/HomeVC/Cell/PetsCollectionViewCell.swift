//
//  PetsCollectionViewCell.swift
//  HSU
//
//  Created by Batuhan Baran on 18.03.2021.
//

import UIKit

class PetsCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "petsCollectionViewCell"

    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureImageView()
    }
    
    func configureImageView() {
        
        contentView.layer.cornerRadius = 40
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 40
        layer.masksToBounds = false
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }

}
