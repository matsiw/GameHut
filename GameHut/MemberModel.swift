//
//  MemberModel.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/7/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

struct MemberModel {
    
    var name: String // name does not have to be unique due to unique id 
    var nickname: String?
    var friends: [String] = []
    var membersFromPastGroups: [MemberModel] = []
    var id: Int // FIX to create a unique number for each user
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
}