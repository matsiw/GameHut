//
//  Database.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 8/4/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

// Acts as a dummy databse for testing and possibly retrieves files from actual database in future

struct Database {
    // temporary "database" to retrieve data from
    private(set) var memberModelArrayFromDB: [MemberModel] = [MemberModel(name: "Ames Smith", id: 1), MemberModel(name: "Ball", id: 2), MemberModel(name: "Bat", id: 3), MemberModel(name: "Adam Smith", id: 4), MemberModel(name: "Bath", id: 5), MemberModel(name: "Bane", id: 6)]
    
}