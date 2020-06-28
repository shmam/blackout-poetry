//
//  ParagraphWordView.swift
//  blackout
//
//  Created by Sam Crochet on 6/27/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import SwiftUI

struct ParagraphWordView: View {
    var wordArray : Array<blackoutModel.Word>
    var viewModel: blackoutApp
    
    @GestureState private var location = CGPoint.zero

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
            .padding()
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(wordArray) { word in
                WordView(word: word)
                    .onTapGesture {
                        self.viewModel.mark(word: word)
                    }
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if word.content == self.wordArray.last?.content {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if word.content == self.wordArray.last?.content {
                            height = 0 // last item
                        }
                        return result
                    })
                    .animation(.easeOut)
            }
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .updating($location) { (value, state, transaction) in
                state = value.location
            }
        )
    }

}
