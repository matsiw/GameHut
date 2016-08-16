//
//  GeneralUseFunctionsAndExtensions.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 8/15/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

class GeneralUseFunctions {
    // return bool on whether a list already has key's string
    func detectDuplicateStringFromList(list: [String], searchKey: String) -> Bool {
        var upperIndex = list.count - 1
        var lowerIndex = 0
        var isDuplicate = false
        var oldIndex = 0
        
        while (lowerIndex <= upperIndex) {
            var currentIndex = (upperIndex + lowerIndex) / 2
            oldIndex = currentIndex
            
            if list[currentIndex] == searchKey {
                while (lowerIndex <= upperIndex) {
                    currentIndex = (upperIndex + lowerIndex) / 2
                    
                    if list[currentIndex] == searchKey && currentIndex != oldIndex {
                        isDuplicate = true
                        break
                    } else {
                        if list[currentIndex] > searchKey {
                            upperIndex = currentIndex - 1
                        } else {
                            lowerIndex = currentIndex + 1
                        }
                    }
                }
            } else {
                if list[currentIndex] > searchKey {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
            
        }
        
        return isDuplicate
    }

}
