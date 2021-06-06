//
//  HealthInformationTableViewCell.swift
//  HSU
//
//  Created by Batuhan Baran on 2.06.2021.
//

import UIKit

class HealthInformationTableViewCell: UITableViewCell {

    static let cellIdentifier = "HealthInformationCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet private weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var healthInfoDescription: UILabel!
    @IBOutlet weak var dateAdded: UILabel!
    @IBOutlet weak var animalName: UILabel!
    
    @IBOutlet weak var healthInfoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureBackView()
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
