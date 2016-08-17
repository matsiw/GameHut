//
//  GroupStateController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/8/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

class GroupStateController {
    private(set) var arrayOfAllGroups = [GroupModel]()
    
    func addModel(model: GroupModel) {
        arrayOfAllGroups.append(model)
    }
    
    func removeModel(row: Int) {
        arrayOfAllGroups.removeAtIndex(row)
    }
    
    func addMembers(members: [MemberModel], groupID: Int) {
        for group in arrayOfAllGroups {
            if group.groupID == groupID {
                for member in members {
                    group.groupMembers.append(member)
                }
            }
        }
    }
}