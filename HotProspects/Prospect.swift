//
//  Prospect.swift
//  HotProspects
//
//  Created by Pranesh Ambokar on 1/6/21.
//

import SwiftUI

class Prospect: Identifiable, Codable { //prospect class to define an object "Prospect"
    var id = UUID() //initialized data
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject { //prospects class to do all the work in
    @Published private(set) var people: [Prospect] //initialized data
    static let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        
        self.people = []
    }
    
    private func save() { //saves data
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.setValue(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
