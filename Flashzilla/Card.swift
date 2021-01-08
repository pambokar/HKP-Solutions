//
//  Card.swift
//  Flashzilla
//
//  Created by Pranesh Ambokar on 1/7/21.
//

import Foundation

struct Card: Codable { //base card class
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
