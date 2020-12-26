//
//  ContentView.swift
//  ChallengeDay
//
//  Created by Pranesh Ambokar on 12/26/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNum = "" //instantiating everything
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var output: Double { //calculation part for the output
        var final = 0.0
        let input = Double(inputNum) ?? 0
        if inputUnit == outputUnit {
            final = input
        }; if inputUnit == 0 && outputUnit == 1 {
            final = input * (9/5) + 32
        }; if inputUnit == 0 && outputUnit == 2 {
            final = input + 273.15
        }; if inputUnit == 1 && outputUnit == 0 {
            final = (input - 32) * (5/9)
        }; if inputUnit == 1 && outputUnit == 2 {
            final = (5/9) * (input - 32) + 273.15
        }; if inputUnit == 2 && outputUnit == 0 {
            final = input - 273.15
        }; if inputUnit == 2 && outputUnit == 1 {
            final = (9/5) * (input + 273.15) - 32
        }
        
        return final
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your input unit is")) { //first segmented section to get input units
                    Picker("input", selection: $inputUnit) {
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Your output unit is")) { //second segmented section to get output units
                    Picker("output", selection: $outputUnit) {
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{ //text field to accept a value to be converted
                    TextField("Input Value?", text: $inputNum)
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Converted answer")) { //output the correct answer
                    Text("\(output) in \(units[outputUnit])")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
