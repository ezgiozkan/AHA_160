//
//  Pets.swift
//  HSU
//
//  Created by Batuhan Baran on 7.05.2021.
//

import Foundation

struct Pets: Decodable {
    
    let name: String
    let gender: String
    let breed: Bool
    let dateOfBirth: Date
    let isNeutered: Bool
    
}
//"id": 3,
//"name": "pablo",
//"gender": "female",
//"breed": "true",
//"dateOfBirth": "2020-01-01T00:00:00",
//"isNeutered": true,
//"url": null,
//"healthInformations": []
