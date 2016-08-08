//
//  AddMemberVCHelper.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 8/8/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

class AddMemberVCHelper {
    
    let theDatabase = Database()
    var membersFromDB: [MemberModel] = []
    let relatedMemberTrie: Trie = Trie()
    var screenedMembers: [String] = []
    var sortedArray: [[String]] = []
    
    func setUpTrie() {
        membersFromDB = theDatabase.memberModelArrayFromDB
        for member in membersFromDB {
            relatedMemberTrie.addWord(member.name)
        }
    }
    
    func findName() {
        var arrayOfNames: Array<String> = []
        for member in membersFromDB {
            arrayOfNames = relatedMemberTrie.findWord(member.name)
            
            for name in arrayOfNames {
                screenedMembers.append(name)
            }
        }
        
    }
    
    // sort names so they are alphabetical and add in letters to group names by common initial letter
    func sortedNames() -> [[String]] {
        findName()
        
        for name in screenedMembers {
            if name[name.startIndex] == "A" {
                
            }
        }
        
        return sortedArray
    }

}