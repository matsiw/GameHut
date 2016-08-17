//
//  TrieStructure.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 8/7/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

class TrieNode {
    
    var key: String!
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
    
}

class Trie {
    
    private var root: TrieNode!
    
    init(){
        root = TrieNode()
    }
    
    // finds all words based on the prefix
    func findWord(keyword: String) -> Array<String>! {
        
        guard keyword.characters.count > 0 else {
            return nil
        }
        
        var current: TrieNode = root
        var wordList: Array<String> = Array<String>()
        
        while(keyword.characters.count != current.level) {
            
            var childToUse: TrieNode!
            let searchKey: String = keyword.substringToIndex(keyword.startIndex.advancedBy(current.level + 1))
            
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            if childToUse == nil {
                return nil
            }
        }
        
        // retrieve the keyword and any decendants
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }
        
        // include only children that are words
        for child in current.children {
            
            if (child.isFinal == true) {
                wordList.append(child.key)
            }
        }

        return wordList
    }
    
    // builds an iterative tree of dictionary content
    func addWord(keyword: String) {
        
        guard keyword.characters.count > 0 else {
            return
        }
        
        var current: TrieNode = root
        
        while(keyword.characters.count != current.level) {
            
            var childToUse: TrieNode!
            let searchKey: String = keyword.substringToIndex(keyword.startIndex.advancedBy(current.level + 1))
            
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    break
                }
            }
            
            // create a new node
            if (childToUse == nil) {
                
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
            
        }
        
        // add final end of word check
        if (keyword.characters.count == current.level) {
            current.isFinal = true
            return
        }
    }
    
    func deleteWord(keyword: String) {
        
    }    
    
}


