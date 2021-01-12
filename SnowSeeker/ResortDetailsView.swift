//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Pranesh Ambokar on 1/11/21.
//

import SwiftUI

struct ResortDetailsView: View { //returns important info required in the resort view class
    let resort: Resort
    var size: String {
        switch resort.size {
            case 1:
                return "Small"
            case 2:
                return "Average"
            default:
                return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            Text("Size: \(size)").layoutPriority(1) //makes sure that these texts get priority
            Spacer().frame(height: 0)
            Text("Price: \(price)").layoutPriority(1)
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
