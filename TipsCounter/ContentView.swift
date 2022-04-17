//
//  ContentView.swift
//  TipsCounter
//
//  Created by Vitaly Gromov on 4/17/22.
//

import SwiftUI

private func finalAmountPerPerson(inputAmount: String, numberOfPerson: Int) -> String {
    let amount: Double = Double(inputAmount) ?? 0.0
    return String(format: "%.2f" , amount/Double(numberOfPerson))
}

struct ContentView: View {
    @State private var inputAmount = ""
    @State private var pickerPersonIndex: Int = 1
    @State private var pickerTipIndex = 2
    //TODO: add "Other" to array
    private var tipArray = ["0", "5", "10", "15", "20"]
    //TODO: add tips to calculating
    private var finalAmount: String {
        let amount: Double = Double(inputAmount) ?? 0.0 //add incorrect input
        return String(format: "%.2f" , amount/Double(pickerPersonIndex + 1))
    }
    
   
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField(text: $inputAmount, prompt: Text("Amount"), label: {})
                    //TODO: bug with pickerPersonIndex
                    Picker(selection: $pickerPersonIndex) {
                        ForEach(1..<101) {
                            Text("\($0) Person")
                        }
                    } label: {
                        Text("Select number of person")
                    }.pickerStyle(.menu)
                    //FIXME: iterations with id
                    Picker(selection: $pickerTipIndex) {
                        ForEach(0..<tipArray.count) {
                            Text("\(tipArray[$0])")
                        }
                    } label: {
                        Text("Select tips")
                    }.pickerStyle(.segmented)
                    
                }.textCase(.none)
                Section(header: Text("Result")) {
                    Text("Total For Person: \(finalAmount) ")
                }.textCase(.none)
                Section(header: Text("Developer section")) {
                    Text("pickerPersonIndex -> \(pickerPersonIndex)")
                    Text("inputAmount -> \(inputAmount)")
                    Text("pickerTipIndex -> \(pickerTipIndex)")
                    Text("finalAmount -> \(finalAmount)")
                }
            }
            .navigationTitle(Text("Tips Counter"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //TODO: show alert
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    
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
