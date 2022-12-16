//
//  FishesViewModel.swift
//  testPLisbethEslava
//
//  Created by Lisbeth Eslava on 16/12/22.
//

import Foundation

class FishesViewModel: NSObject {
    
    private var apiService: APIService!
    private(set) var fishehInfo: [Fish]! {
        didSet {
            self.bindFishesViewModelToController()
        }
    }
    
    var bindFishesViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        loadFishesInformation()
    }
    
    func loadFishesInformation() {
        self.apiService.apiToGetFishesData { fishesInfo in
            print("log_ LA INFO OBTENIDA ES \(fishesInfo)")
            self.fishehInfo = fishesInfo
        }
    }
}
