//
//  PetDetailCollectionViewDataSource.swift
//  HSU
//
//  Created by Batuhan Baran on 3.04.2021.
//

import Foundation
import UIKit

class PetDetailCollectionViewDataSource: NSObject {
    
    var titles = ["İsim","Cins","Cinsiyet","Doğum Yılı","Kısırlık Durumu"]
    var subTitles = [String]()
    var selectedPet: Pets?
    
    init(selectedPet: Pets?) {
        super.init()
        
        self.selectedPet = selectedPet
        self.configureSubTitles()
    }
    
    func configureSubTitles() {
        
        self.subTitles.append(self.selectedPet?.name ?? "name")
        self.subTitles.append(self.selectedPet?.breed ?? "breed")
        self.subTitles.append(self.selectedPet?.gender ?? "gender")
        self.subTitles.append(self.selectedPet?.dateOfBirth ?? "dateOfBirth")
        self.subTitles.append((self.selectedPet?.isNeutered == true) ? "Kısır" : "Kısır değil")
        
    }
}

extension PetDetailCollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.titles.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetDetailCollectionViewCell.cellIdentifier, for: indexPath) as! PetDetailCollectionViewCell
        
        cell.titleLabel.text = self.titles[indexPath.row]
        cell.subTitleLabel.text = self.subTitles[indexPath.row]
        
        return cell
    }


    
}
