//
//  SpeciesImage.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import Foundation

struct SpeciesImage: Decodable {
    
    let src: String
    
    enum CodingKeys: String, CodingKey {
        case src = "src"
    }
}
