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
    
}