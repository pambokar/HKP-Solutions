//
//  Resort.swift
//  SnowSeeker
//
//  Created by Pranesh Ambokar on 1/11/21.
//

import Foundation

struct Resort: Codable, Identifiable { //base class "Resort"
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
}
