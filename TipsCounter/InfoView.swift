//
//  InfoView.swift
//  TipsCounter
//
//  Created by Vitaly Gromov on 6/15/22.
//

import SwiftUI

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

