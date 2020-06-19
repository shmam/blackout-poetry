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
     called to set the values for the text view, they are modifying and being used to declare the view with these values. It's not like OOP where these functions are internal modifications to an already existing heap object 
     */
    var body: some View {
        VStack{
            Text("blackout")
                .font(.largeTitle)
                .fontWeight(.black)
                .strikethrough()
            
            TestWrappedLayout(wordArray: viewModel.words, viewModel: self.viewModel)
                .padding()
        }
    }
}

struct WordView: View{
    var word : blackoutModel.Word
    var body : some View{
        ZStack {
            if word.isMarked {
                Text(word.content)
                    .fontWeight(.semibold)
                    .padding(.trailing, 7)
                    .background(Color.black)
            } else {
                Text(word.content)
                    .fontWeight(.semibold)
                    .padding(.trailing, 7)
                
            }
        }
        .foregroundColor(.black)
        .font(.headline)
    }
}

struct TestWrappedLayout: View {
    var wordArray : Array<blackoutModel.Word>
    var viewModel: blackoutApp

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(wordArray) { word in
                WordView(word: word)
                    .onTapGesture {
                        self.viewModel.mark(word: word)
                        print("tap tap \(word.content)")
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
            }
        }
    }

}

struct buttonView: View {
    var body: some View{
        HStack{
            Button(Text("export"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: blackoutApp())
    }
}
