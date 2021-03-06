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
    
    // for use after group creation
    func addMembers(members: [MemberModel], ID: Int) {
        for group in arrayOfAllGroups {
            if group.groupID == ID {
                for member in members {
                    print(member.name)
                    group.groupMembers.append(member)
                }
            }
        }
    }
    
    // for use after group creation
    func removeMembers(members: [MemberModel], ID: Int) {
        for group in arrayOfAllGroups {
            if group.groupID == ID {
                for member in members {
                    print(member.name)
                    let count = group.groupMembers.count - 1
                    var start = 0
                    while (start < count) {
                        if group.groupMembers[start].id == member.id {
                            group.groupMembers.removeAtIndex(start)
                            group.numberOfGroupMembers = group.numberOfGroupMembers - 1
                        }
                        start = start + 1
                    }
                }
            }
        }
    }
    
}

