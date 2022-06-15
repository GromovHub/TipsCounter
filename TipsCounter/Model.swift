//
//  Model.swift
//  TipsCounter
//
//  Created by Vitaly Gromov on 6/15/22.
//

import Foundation

class Model: ObservableObject {
    // changeable parameters
    @Published var inputAmount = "" { didSet { calculate() } }
    // index 1 -> 2 person
    @Published var personIndex = 1 { didSet { calculate() } }
    @Published var tipsVariant = 1 { didSet { calculate() } }
    
    // result parameters
    var finalForPersonWithTips: String = ""
    var finalForPersonWithNoTips: String = ""
    var tipsForWaiter: String = ""
    
    // other parameters
    let tipsVariants = ["0", "5", "10", "15", "20"]
    @Published var showInfoSection = false
    
    private func calculate() {
        let amount = Double(inputAmount) ?? 0.0
        let numberOfPerson = Double(personIndex + 1)
        let tipsPercentage = Double(tipsVariants[tipsVariant]) ?? 0.0
        print(amount, numberOfPerson, tipsPercentage)
        if tipsPercentage == 0.0 {
            finalForPersonWithTips = String(amount / numberOfPerson)
            finalForPersonWithNoTips = String(amount / numberOfPerson)
            tipsForWaiter = "0.0"
        } else {
            tipsForWaiter = String(amount * (tipsPercentage / 100))
            finalForPersonWithTips = String((amount + (amount * tipsPercentage / 100)) / numberOfPerson)
            finalForPersonWithNoTips = String(amount / numberOfPerson)
        }
    }
}


//private var finalForPersonAmount: String {
//    let amount: Double = Double(inputAmount) ?? 0.0
//    let tips: Double = Double(tipArray[pickerTipIndex]) ?? 0.0
//    let person: Double = Double(pickerPersonIndex) + 1
//    let final = (amount * ((tips + 100) / 100)) / person
//    return String(format: "%.2f", final)
//}
//private var totalTips: String {
//    let amount: Double = Double(inputAmount) ?? 0.0
//    let person = Double(pickerPersonIndex)
//    let finalAmountInDouble = Double(finalForPersonAmount) ?? 0.0
//    let totalTips = finalAmountInDouble * (person + 1) - amount
//    return String(format: "%.2f", totalTips)
//}
//private func finalAmountPerPerson(inputAmount: String, numberOfPerson: Int) -> String {
//    let amount: Double = Double(inputAmount) ?? 0.0
//    return String(format: "%.2f" , amount/Double(numberOfPerson))
//}
