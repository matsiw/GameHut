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
    var screenedMembers: [MemberModel] = []
    var sortedArray: [[String]] = []
    
    private struct Constants {
        
        // Upper Case Alphabet
        static let upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        //// static let nameAndID = "\(member.name)|\(member.id)" //// Make sure all uses of this match
    }
    
    func setUpTrie() {
        membersFromDB = theDatabase.memberModelArrayFromDB
        for member in membersFromDB {
            relatedMemberTrie.addWord("\(member.name)|\(member.id)")
        }
    }
    
    // screen names from trie to format [MemberModel] and remove possible duplicates
    func screenRelatedNames() {
        var arrayOfNames: Array<String> = []
        var memberName: [String] = []
        var memberID: [Int] = []
        var tempArray: [String] = []
        
        for member in membersFromDB {
            arrayOfNames = relatedMemberTrie.findWord("\(member.name)|\(member.id)")
            for name in arrayOfNames {
                tempArray.append(name)
            }
            (memberName, memberID) = getNameAndIDFromPipedStringArray(tempArray)
        }
        
        let count = memberName.count
        var start = 0
        while (start < count - 1) {
            screenedMembers.append(MemberModel(name: memberName[start], id: memberID[start]))
            start = start + 1
        }
        
        screenedMembers.sortInPlace { $1.name > $0.name }
    }
    
    func getNameAndIDFromPipedStringArray(array: [String]) -> (memberName: [String], memberID: [Int]) {
        var memberName: [String] = []
        var memberID: [Int] = []
        var pipeIndex: Int?
        
        for name in array {
            for index in name.characters.indices {
                // name and ID seperated by | symbol
                if name[index] == "|" {
                    pipeIndex = name.startIndex.distanceTo(index) + 1
                }
            }
            memberName.append(name.substringToIndex(name.startIndex.advancedBy(pipeIndex! - 1)))
            memberID.append(Int(name.substringFromIndex(name.startIndex.advancedBy(pipeIndex!)))!)
        }
        return (memberName, memberID)
    }
    
    // sort names so they are alphabetical and add in letters to group names by common initial letter
    func sortNames() -> [[String]] {
        setUpTrie()
        screenRelatedNames()
        
        // Initialize sortedArray for looping
        var count = Constants.upperAlphabet.characters.count
        while(count > 0) {
            sortedArray.append([""])
            count = count - 1
        }
        
        // adding name to grouped lettering
        for member in screenedMembers {
            let capitalized = member.name.capitalizedString
            let firstLetterOfFirstName = capitalized[member.name.startIndex]
            for character in Constants.upperAlphabet.characters {
                    if character == firstLetterOfFirstName {
                        let string = String(character)
                        let value = Int((string.unicodeScalars.first?.value)!) - 65
                        var initialIndex = 0
                        sortedArray[value][initialIndex] = string
                        initialIndex = initialIndex + 1
                        sortedArray[value].append("\(member.name)|\(member.id)") // remove member id when displaying
                        
                    }
                }
        }
        
        // adding name to recents ("recent" means most recent 3 groups joined/created or up to last 10 people in same group)
        //
        // ADD HERE
        //
        
        // check for empty strings and remove
        count = Constants.upperAlphabet.characters.count - 1
        while (count > 0) {
            if sortedArray[count] == [""] {
                sortedArray.removeAtIndex(count)
            }
            count = count - 1
        }
        
        /////////// TEST ///////////
        print(sortedArray)
        /////////// TEST ///////////
        
        
        return sortedArray
    }

}



