//
//  ContentView.swift
//  TipsCounter
//
//  Created by Vitaly Gromov on 4/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: Model = Model()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField(text: $model.inputAmount, prompt: Text("Amount"), label: {})
                        .keyboardType(.decimalPad)
                    //TODO: bug with pickerPersonIndex
                    Picker(selection: $model.personIndex) {
                        ForEach(1..<101) {
                            Text("\($0) Person")
                        }
                    } label: {
                        Text("Select Number Of Person")
                    }.pickerStyle(.menu)
                }.textCase(.none)
                Section(header: Text("Tips")) {
                    //FIXME: iterations with id
                    Picker(selection: $model.tipsVariant) {
                        ForEach(model.tipsVariants.indices) {
                            Text("\(model.tipsVariants[$0])")
                        }
                    } label: {
                        Text("Select tips")
                    }.pickerStyle(.segmented)
                }.textCase(.none)
                Section(header: Text("Result")) {
                    Text("For Person With Tips: \(model.finalForPersonWithTips) ")
                    Text("For Person With No Tips: \(model.finalForPersonWithNoTips) ")
                    Text("Tips For Waiter: \(model.tipsForWaiter) ")
                }.textCase(.none)
            }
            .navigationTitle(Text("Tips Counter"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        model.showInfoSection.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }.sheet(isPresented: $model.showInfoSection, content: {
                        InfoView(
                            inputAmount: model.inputAmount,
                            pickerPersonIndex: model.personIndex,
                            pickerTipIndex: model.tipsVariant,
                            finalAmount: model.finalForPersonWithTips
                        )
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
