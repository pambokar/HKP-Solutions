//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Pranesh Ambokar on 1/11/21.
//

import SwiftUI

class Favorites: ObservableObject { //lets users favorite resorts
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        //load saved data
        self.resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        //write data
    }
}
