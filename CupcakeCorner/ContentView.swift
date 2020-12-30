//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Pranesh Ambokar on 12/30/20.
//

import SwiftUI

struct ContentView: View { //first page of the app
    @ObservedObject var order = Order() //all the other pages use this one Order variable
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) { //picker for cakes
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20) { //stepper for amount of cakes
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) { //toggle for special requests
                        Text("Any special requests?")
                    }
                    if order.specialRequestEnabled { //toggle for extra frosting ONLY WHEN SPECIAL REQUESTS IS ON
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.addSprinkles) { //toggle for extra sprinkles ONLY WHEN SPECIAL REQUESTS IS ON
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) { //takes to delivery page
                        Text("Delivery Details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
