//
//  MemberModel.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/7/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

struct MemberModel {
    
    var name: String
    var friends: [String] = []
    var id: Int = 1 // FIX
    
    init(name: String) {
        self.name = name
    }
    
}