//
//  WordView.swift
//  blackout
//
//  Created by Sam Crochet on 6/27/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import SwiftUI

struct WordView: View{
    var word : blackoutModel.Word
    var body : some View{
        ZStack {
            if word.isMarked {
                Text(word.content)
                    .fontWeight(.heavy)
                    .padding(.trailing, 7)
                    .background(Color.black)
            } else {
                Text(word.content)
                    .fontWeight(.heavy)
                    .padding(.trailing, 7)
                
            }
        }
        .font(.custom("Menlo-Regular", size: 16))
        
    }
}
