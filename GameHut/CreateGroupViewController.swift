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
    
    let groupStateController = GroupStateController()
    let localMemberStateController = LocalMemberStateController()
    
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
        // Set all information to a new copy of a model and pass it to the state
        
        // Check if groupName is empty and send error if true

        let model = GroupModel(groupName: groupName.text!, groupID: 1, groupOwner: localMemberStateController.localMember.name)
        groupStateController.addModel(model)
    
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)

    }
    
}