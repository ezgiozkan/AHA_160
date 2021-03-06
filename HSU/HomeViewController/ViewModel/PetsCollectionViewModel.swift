//
//  PetsCollectionViewModel.swift
//  HSU
//
//  Created by Batuhan Baran on 10.05.2021.
//

import Foundation

class PetsCollectionViewModel {
    
    let responseModel: [Pets]?
    
    init(responseModel: [Pets]?) {
        self.responseModel = responseModel
    }
    
    func numberOfItemsInSection() -> Int? {
        return (responseModel?.count ?? 0) + 1
    }
    
    func cellForItemAt(indexPath: Int) -> Pets?{
        let pet = responseModel?[indexPath - 1]
        return pet
    }
}
