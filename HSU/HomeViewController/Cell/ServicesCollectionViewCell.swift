//
//  ServicesCollectionViewCell.swift
//  HSU
//
//  Created by Batuhan Baran on 19.03.2021.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "servicesCollectionViewCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
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
