//
//  BiographyFish.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import Foundation

struct BiographyFish: Decodable {
    
    let speciesName: String
    let scientificName: String
    let calories: String
    let profileImage: SpeciesImage
    let gallery: [SpeciesImage]?
    
    enum CodingKeys: String, CodingKey {
        case speciesName = "Species Name"
        case scientificName = "Scientific Name"
        case calories = "Calories"
        case profileImage = "Species Illustration Photo"
        case gallery = "Image Gallery"
    }
}
