//
//  BiographyFishViewModel.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import Foundation

class BiographyFishViewModel: NSObject {
    
    private var apiService: APIService!
    private var myUrl: String = "https://www.fishwatch.gov/api/species/"
    private(set) var biographyFishInfo: BiographyFish! {
        didSet {
            self.bindBiographyFishViewModelToController()
        }
    }
    
    var bindBiographyFishViewModelToController : (() -> ()) = {}
    
    init(specieName: String) {
        super.init()
        self.myUrl += specieName
        self.apiService = APIService()
        loadBiography()
    }
    
    
    
    func loadBiography() {
        myUrl = myUrl.replacingOccurrences(of: " ", with: "%20")
        self.apiService.apiToGetBiographyFishData(path: myUrl) { biographyFishInfo in
            print("log_ LA INFO OBTENIDA ES \(biographyFishInfo)")
            self.biographyFishInfo = biographyFishInfo
        }
    }
}
