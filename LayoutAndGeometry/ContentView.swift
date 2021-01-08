//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Pranesh Ambokar on 1/7/21.
//

import SwiftUI

struct ContentView: View { //this project was more informational than project building
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow] //initialized array
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) { //gets a horizontal scroll view
                HStack {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                            Rectangle()
                                .fill(self.colors[index % 7])
                                .frame(height: 150)
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0)) //3D Rotation effect
                        }
                        .frame(width: 150)
                    }
                }
                .padding(.horizontal, (fullView.size.width - 150) / 2)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
