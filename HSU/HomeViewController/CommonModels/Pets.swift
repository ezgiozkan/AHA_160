//
//  Pets.swift
//  HSU
//
//  Created by Batuhan Baran on 7.05.2021.
//

import Foundation

struct Pets: Decodable {
    
    let id: Int
    let name: String
    let gender: String
    let breed: String
    let dateOfBirth: String
    let isNeutered: Bool
    let type: String
    
    //TODO: healthInfo or media...
}
