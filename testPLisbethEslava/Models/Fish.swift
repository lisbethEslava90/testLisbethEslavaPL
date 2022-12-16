//
//  Fish.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import Foundation

struct Fish: Decodable {
    let speciesName: String
    let region: String
    let speciesImage: SpeciesImage
    
    enum CodingKeys: String, CodingKey {
        case speciesName = "Species Name"
        case region = "NOAA Fisheries Region"
        case speciesImage = "Species Illustration Photo"
    }
}

struct SpeciesImage: Decodable {
    let src: String
    
    enum CodingKeys: String, CodingKey {
        case src = "src"
    }
}
