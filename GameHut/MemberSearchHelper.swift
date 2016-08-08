//
//  MemberSearchHelper.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 8/3/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

class MemberSearchHelper
{
    // Instantiate database to access methods
    let theDatabase = Database()
    
    // linear search
    func searchFor(firstName: String, lastName: String) -> MemberModel? {
        // search the array of Members in the database by name
        
        var returnMember: MemberModel?
        
        for member in theDatabase.memberModelArrayFromDB as [MemberModel] {
            if member.name == "\(firstName) \(lastName)" {
                returnMember = member
            }
        }
        
        return returnMember
    }
    
}



