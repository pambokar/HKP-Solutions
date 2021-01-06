//
//  Result.swift
//  BucketList
//
//  Created by Pranesh Ambokar on 1/5/21.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    static func < (lhs: Page, rhs: Page) -> Bool { //this makes a part of my code on a different view work
        lhs.title < rhs.title
    }
}
