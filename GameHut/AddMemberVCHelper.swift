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
    
    private struct Constants {
        
        // Upper Case Alphabet
        static let upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
    
    func setUpTrie() {
        membersFromDB = theDatabase.memberModelArrayFromDB
        for member in membersFromDB {
            relatedMemberTrie.addWord(member.name)
        }
    }
    
    // screen names from trie to format [String] and to only members in User's Friends group or in a Recent Group
    func screenRelatedNames() {
        var arrayOfNames: Array<String> = []
        for member in membersFromDB {
            arrayOfNames = relatedMemberTrie.findWord(member.name)
            
            for name in arrayOfNames {
                screenedMembers.append(name)
            }
        }
        
    }
    
    // autocomplete for the Related Member Trie
    func autocomplete(typedString: String) -> [String] {
            return relatedMemberTrie.autocomplete(typedString)
    }
    
    // arrange an array of strings in alphabetical order
    func arrangeAlphabetically() {
        
    }
    
    // return bool on whether a list already has keys string
    func detectDuplicate(list: [String], searchKey: String) -> Bool {
        return true
    }
    
    // sort names so they are alphabetical and add in letters to group names by common initial letter
    func sortNames() -> [[String]] {
        setUpTrie()
        screenRelatedNames()
        
        var count = Constants.upperAlphabet.characters.count
        while(count > 0) {
            sortedArray.append([""])
            count = count - 1
        }
        
        // adding name to grouped lettering
        for name in screenedMembers {
            let capitalized = name.capitalizedString
            let firstLetterOfFirstName = capitalized[name.startIndex]
            for character in Constants.upperAlphabet.characters {
                    if character == firstLetterOfFirstName {
                        let string = String(character)
                        let value = Int((string.unicodeScalars.first?.value)!) - 65
                        var initialIndex = 0
                        sortedArray[value][initialIndex] = string
                        initialIndex = initialIndex + 1
                        sortedArray[value].append(name)
                        
                    }
                }
        }
        
        // adding name to recents ("recent" means most recent 3 groups joined/created or up to last 10 people in same group)
        //
        // ADD HERE
        //
        
        count = Constants.upperAlphabet.characters.count - 1
        while (count > 0) {
            if sortedArray[count] == [""] {
                sortedArray.removeAtIndex(count)
            }
            count = count - 1
        }
        
        let autocompleteTest = autocomplete("A")
        print(autocompleteTest)
        print(sortedArray)
        return sortedArray
    }

}



