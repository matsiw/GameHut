//
//  CreateGroupViewController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 6/26/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController, UINavigationBarDelegate
{
    @IBOutlet weak var createGroupNavBar: UINavigationBar!
    
    var groupStateController: GroupStateController?
    var localMemberStateController: LocalMemberStateController?
    
    @IBOutlet weak var groupName: UITextField!
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
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
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached
    }
    @IBAction func createGroup(sender: UIButton) {
        guard let state = groupStateController else { return }
        guard let member = localMemberStateController else { return }
        
        // Set all information to a new copy of a model and pass it to the state

        var model = GroupModel(groupName: groupName.text!, groupID: 1, groupOwner: member.localMember!.name)
        state.arrayOfAllGroups.append(model)
        
    }
    
}