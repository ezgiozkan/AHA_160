//
//  HealthInformation.swift
//  HSU
//
//  Created by Batuhan Baran on 2.06.2021.
//

import Foundation

struct HealthInformation: Decodable {
    let animalId: Int
    let title: String
    let subtitle: String
    let description: String
    let dateAdded: String
}
