//
//  LocalMemberStateController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/11/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation


class LocalMemberStateController {
    // this class should only effect the local user and not users across the network
    private(set) var localMember = MemberModel(name: "User", id: 0) // temporary FIX
    
    func setNickname(name: String) {
        localMember.nickname = name
    }
    
    func addMembersFromGroup(members: [MemberModel]) {
        for member in members {
            // check if member already in past member group
            // fix since this loop will be slow for large number of people in group (make binary search)
            for pastMember in localMember.membersFromPastGroups {
                if pastMember.id == member.id {
                    continue
                } else {
                    localMember.membersFromPastGroups.append(member)
                }
            }
        }
    }
}