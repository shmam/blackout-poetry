//
//  ContentView.swift
//  blackout
//
//  Created by Sam Crochet on 6/14/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: blackoutApp
    
    /**
    Declarative programming as opposed to imperitive, at any point the .font and .strikethrough functions are not being
    called to set the values for the text view, they are modifying and being used to declare the view with these values.
    It's not like OOP where these functions are internal modifications to an already existing heap object
     */
    var body: some View {
        VStack{
            TitleView()
            ParagraphWordView(wordArray: viewModel.words, viewModel: self.viewModel)
            ButtonView(viewModel: self.viewModel)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: blackoutApp())
    }
}
