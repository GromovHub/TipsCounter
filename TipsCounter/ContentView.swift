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

struct InfoView: View {
    //TODO: send var from content to info through sheet
    var inputAmount: String
    var pickerPersonIndex: Int
    var pickerTipIndex: Int
    var finalAmount: String
    
    var body: some View {
        Text("You are in info section")
        Text("pickerPersonIndex -> \(pickerPersonIndex)")
        Text("inputAmount -> \(inputAmount)")
        Text("pickerTipIndex -> \(pickerTipIndex)")
        Text("finalAmount -> \(finalAmount)")
    }
}

struct ContentView: View {
    @State private var inputAmount = ""
    @State private var pickerPersonIndex: Int = 1
    @State private var pickerTipIndex = 2
    @State private var showingSheet = false
    //TODO: add "Other" to array
    private var tipArray = ["0", "5", "10", "15", "20"]
    
    private var finalAmount: String {
        let amount: Double = Double(inputAmount) ?? 0.0
        let tips: Double = Double(tipArray[pickerTipIndex]) ?? 0.0
        let person: Double = Double(pickerPersonIndex) + 1
        let final = (amount * ((tips + 100) / 100)) / person
        return String(format: "%.2f", final)
    }
    private var totalTips: String {
        let amount: Double = Double(inputAmount) ?? 0.0
        let person = Double(pickerPersonIndex)
        let finalAmountInDouble = Double(finalAmount) ?? 0.0
        let totalTips = finalAmountInDouble * (person + 1) - amount
        return String(format: "%.2f", totalTips)
    }
    
   
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField(text: $inputAmount, prompt: Text("Amount"), label: {})
                        .keyboardType(.decimalPad)
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
                    Text("Final For Person: \(finalAmount) ")
                    Text("Total tips: \(totalTips) ")
                }.textCase(.none)
                
                //TODO: hide this section from alert
                Section(header: Text("Developer section")) {
                    Text("pickerPersonIndex -> \(pickerPersonIndex)")
                    Text("inputAmount -> \(inputAmount)")
                    Text("pickerTipIndex -> \(pickerTipIndex)")
                    Text("finalAmount -> \(finalAmount)")
                }.opacity(0.5)
            }
            .navigationTitle(Text("Tips Counter"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }.sheet(isPresented: $showingSheet, content: {
                        InfoView(inputAmount: inputAmount, pickerPersonIndex: pickerPersonIndex, pickerTipIndex: pickerTipIndex, finalAmount: finalAmount)
                    })
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
