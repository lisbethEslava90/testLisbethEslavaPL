//
//  APIService.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import Foundation

class APIService: NSObject {
    
    private let sourceURL = URL(string: "https://www.fishwatch.gov/api/species")!
    
    func apiToGetFishesData(completion: @escaping([Fish]) -> ()) {
        URLSession.shared.dataTask(with: sourceURL) { (data, response, error) in
            guard let data else {
                print("error cargando la informacion...")
                return
            }
            let jsonDecoder = JSONDecoder()
            guard let fishesData = try? jsonDecoder.decode([Fish].self, from: data) else { return }
            
            completion(fishesData)
        }.resume()
    }
    
    func apiToGetBiographyFishData(path: String, completion: @escaping(BiographyFish) -> ()) {
        let sourceURL = URL(string: path)!
        URLSession.shared.dataTask(with: sourceURL) { (data, response, error) in
            guard let data else {
                print("error cargando la informacion...")
                return
            }
            let jsonDecoder = JSONDecoder()
            guard let biographyFishData = try? jsonDecoder.decode([BiographyFish].self, from: data) else { return }
            
            completion(biographyFishData.first ?? BiographyFish(speciesName: "", scientificName: "", calories: "", profileImage: SpeciesImage(src: ""), gallery: nil))
        }.resume()
    }
}
