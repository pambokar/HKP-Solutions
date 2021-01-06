//
//  ContentView.swift
//  Accessibility
//
//  Created by Pranesh Ambokar on 1/5/21.
//

import SwiftUI

struct ContentView: View { //this was the last stand alone video in the section, so I just took notes on it
    @State private var rating = 3
    
    var body: some View {
        Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5) //makes slider less vague and more understandable
            .accessibility(value: Text("\(rating) out of 5"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
