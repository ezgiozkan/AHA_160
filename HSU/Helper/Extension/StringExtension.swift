//
//  StringExtension.swift
//  HSU
//
//  Created by Batuhan Baran on 10.05.2021.
//

import Foundation

extension String {
    
    func configureDate(date: String) -> String? {
        
        let strDate = date.components(separatedBy: "T").first?.replacingOccurrences(of: "-", with: "/")
        return strDate
    }
}


