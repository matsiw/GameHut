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
    var groupOwner: Bool = false
    var numberOfGroupMembers: Int = 1 // at least one member needed for group to exist
    var namesOfGroupMembers: [String] = []
    var nicknamesOfGroupMembers: [String] = []
    var groupImage: UIImage?
    let dateMade: NSDate = NSDate() // FIX THIS
    
    // network specfic properties
    var accessType: AccessType = .Public // public or private
    
    init(groupName: String) {
        self.groupName = groupName
    }
    
    
    
    
    
    
    enum AccessType {
        case Public
        case Private
    }
    
    
    
    
    
    
    
    
    
    
}