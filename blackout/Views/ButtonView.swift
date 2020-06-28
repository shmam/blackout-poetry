//
//  ButtonView.swift
//  blackout
//
//  Created by Sam Crochet on 6/27/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    // viewModel object that we use to interact with the model
    var viewModel: blackoutApp
    
    // Since we are making a ton of buttons with the same button look and different labels/functions
    // This function alllows for the creation of many buttons and action functions
    private func buttonFactory(label:String,actionFunc: @escaping ()->Void) -> some View{
        return ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.black)
            Button(action: actionFunc) {
                Text(label)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
        }
        .frame(height:40)
        .padding(.horizontal, 5)
    }

    // returned values
    var body: some View{
        HStack{
            self.buttonFactory(label: "New", actionFunc: self.viewModel.newpoem)
            self.buttonFactory(label: "Export", actionFunc: self.viewModel.export)
            self.buttonFactory(label: "Mark all", actionFunc: self.viewModel.markall)
        }.padding()
    }
}
