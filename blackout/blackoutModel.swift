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

    private(set) var words: Array<Word> = []
    private(set) var articleDict: Dictionary<String,String> = Dictionary()
    private(set) var textContent: String = ""
    
    /**
    method called when user taps on a word, therefore marking it
     mutating function because it is changing the internal variables in our struct
     */
    mutating func mark(word: Word) -> Void{
        if let markedWordIndex = self.words.indexOf(matching: word){
            self.words[markedWordIndex].isMarked = !self.words[markedWordIndex].isMarked
        }
        else{
            fatalError("self.words.indexof returned nil, expected int value. Stopping Execution")
        }
    }
    
    mutating func mark(word: Word, value: Bool) -> Void{
        if let markedWordIndex = self.words.indexOf(matching: word){
            self.words[markedWordIndex].isMarked = value
        }
        else {
            fatalError("self.words.indexof returned nil, expected int value. Stopping Execution")
        }
    }
    
    mutating func newPoem() -> Void{
        
        self.words = []
        self.textContent = self.articleDict.randomElement()!.value
        let split_content = self.textContent.components(separatedBy: " ")
        
        for index in split_content.indices{
            words.append(Word(id: index, content: split_content[index], isMarked: false))
        }
    }
    
    private func loadJSONDict() -> Dictionary<String,String>{
        do {
            if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: String] {
                    // json is a dictionary
                    return object
                } else if let object = json as? [String] {
                    // json is an array
                    print(type(of: object))
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        fatalError("Failed to load model for applicaiton, trouble parsing json")
    }
    
    /**
    method called when you want to export only the words that were not marked
    */
    func export() -> String {
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
    init(){
        self.articleDict = loadJSONDict()
        self.textContent = self.articleDict.randomElement()!.value
        let split_content = self.textContent.components(separatedBy: " ")
        
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
