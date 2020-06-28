//
//  Array+Identifiable.swift
//  blackout
//
//  Created by Sam Crochet on 6/27/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import Foundation

extension Array where Element : Identifiable{
    
    func indexOf(matching identifiableElement: Element) -> Int?{
        for index in 0..<self.count{
            if self[index].id == identifiableElement.id{
                return index
            }
        }
        return nil
    }
}
