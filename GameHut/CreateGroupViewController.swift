//
//  CreateGroupViewController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 6/26/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController, UINavigationBarDelegate, AddMembersToCreateGroup
{
    @IBOutlet weak var createGroupNavBar: UINavigationBar!
    
    var groupStateController = GroupStateController()
    var localMemberStateController = LocalMemberStateController()
    var arrayOfMembersToBeAdded: [MemberModel] = []
    
    @IBOutlet weak var groupName: UITextField!
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addPotentialMember(member: MemberModel) {
        arrayOfMembersToBeAdded.append(member)
    }
    
    func deletePotentialMember(member: MemberModel) {
        for (index, existing) in arrayOfMembersToBeAdded.enumerate() {
            if member.id == existing.id {
               arrayOfMembersToBeAdded.removeAtIndex(index)
            }
        }
    }
    
    private struct Constants
    {
        // Segue Identifiers
        static let AddMember = "AddMember"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Group"
        createGroupNavBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.AddMember {
            if let destinationViewController = segue.destinationViewController as? AddMembersViewController {
                destinationViewController.groupStateController = groupStateController
                destinationViewController.localMemberStateController = localMemberStateController
                destinationViewController.addMembersToCreateGroup = self
            }
        }
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached
    }
    
    @IBAction func createGroup(sender: UIButton) {
        // Check if groupName is empty and send error if true
        if groupName.text == "" {
            print("error, no group name")
        }
        
        let model = GroupModel(groupName: groupName.text!, groupID: 1, groupOwner: localMemberStateController.localMember.name)
        groupStateController.addModel(model)
        groupStateController.addMembers(arrayOfMembersToBeAdded, ID: model.groupID)
    
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)

    }
    
}