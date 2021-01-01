//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Pranesh Ambokar on 1/1/21.
//

import SwiftUI

struct EmojiRatingView: View { //used as a reference to put on the main page
    let rating: Int16 //grades the book according to rating in emojis
    
    var body: some View {
        switch rating {
        case 1:
            return Text("😴")
        case 2:
            return Text("☹️")
        case 3:
            return Text("😐")
        case 4:
            return Text("😄")
        default:
            return Text("🤩")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
