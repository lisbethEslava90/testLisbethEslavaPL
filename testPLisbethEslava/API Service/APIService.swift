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
            let fishesData = try! jsonDecoder.decode([Fish].self, from: data)
            
            completion(fishesData)
        }.resume()
    }
}
