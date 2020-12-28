//
//  ContentView.swift
//  Animations
//
//  Created by Pranesh Ambokar on 12/27/20.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier { //rotates the corner of the rectangle
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
                                    .clipped()
    }
}

extension AnyTransition { //lets us call pivot and creates one animation that brings the rectangle out, while another brings it back in
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingRed = false //initial value
    var body: some View {
        VStack {
            Button ("Tap me") { //button to be pressed
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed == true { //if the rectangle is showing, do this
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
