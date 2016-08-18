//
//  GroupModel.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/7/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation
import UIKit

class GroupModel {
    
    // group specfic properties
    var groupName: String
    var groupID: Int  // FIX // each group must have unique id
    var groupOwner: String
    
    var numberOfGroupMembers: Int = 1 // at least one member needed for group to exist
    var groupMembers: [MemberModel] = []
    
    var groupImage: UIImage = UIImage(named: ImageAssets.Default.rawValue)!
    // network specfic properties
    var accessType: AccessType = .Public // public or private in terms of being seen by the world or just by friends
    
    init(groupName: String, groupID: Int, groupOwner: String) {
        self.groupName = groupName
        self.groupID = groupID
        self.groupOwner = groupOwner
    }
    
    enum AccessType {
        case Public
        case Private
    }
    
    enum ImageAssets: String {
        case Default = "Default"
    }
}
