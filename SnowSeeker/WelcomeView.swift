//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Pranesh Ambokar on 1/11/21.
//

import SwiftUI

struct WelcomeView: View { //if user goes into landscape mode on the front page of the app, this page pops up
    var body: some View {
        VStack {
            Text("Welcome to Snowseeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left hand menu; swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
