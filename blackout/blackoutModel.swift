//
//  blackoutModel.swift
//  blackout
//
//  Created by Sam Crochet on 6/14/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import Foundation

/**
   Model struct, representing the buisness logic and being consumed by the viewmodel
*/
struct blackoutModel {

    var words: Array<Word>
    
    /**
    method called when user taps on a word, therefore marking it
     mutating function because it is changing the internal variables in our struct
     */
    mutating func mark(word: Word) -> Void{
        let markedWordIndex = indexOf(of: word)
        self.words[markedWordIndex].isMarked = !self.words[markedWordIndex].isMarked
    }
    
    func indexOf(of searchableWord: Word) -> Int {
        for currentIndex in 0..<words.count {
            if searchableWord.id == words[currentIndex].id{
                return currentIndex
            }
        }
        return -1
    }
    
    /**
    method called when you want to export only the words that were not marked
    */
    func export() -> String{
        var export_poem: String = ""
        
        for each_word in words{
            if !each_word.isMarked {
                export_poem.append(" ")
                export_poem.append(each_word.content)
            }
        }
        return export_poem
    }
    
    /**
       Initalizes the struct, taking in a paragraph and splitting the words by spaces
    */
    init(poem: String){
        words = Array<Word>()
        
        let split_content = poem.components(separatedBy: " ")
        
        for index in split_content.indices{
            words.append(Word(id: index, content: split_content[index], isMarked: false))
        }
    }
    
    
    /**
     internal struct that contains the variables and states for each individual word.
     structs are value types, so every time they are passed around as a parameter to a function, they are copied:
        you are not modifying that word you are modifying a copy of that word
     */
    struct Word: Identifiable{
        var id: Int
        var content: String
        var isMarked: Bool
    }
}
