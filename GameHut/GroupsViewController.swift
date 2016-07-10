//
//  GroupsViewController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 6/26/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController, UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource
{
    // MARK: View Controller Configuration
    
    @IBOutlet weak var groupNavBar: UINavigationBar!
    @IBOutlet weak var groupTableView: UITableView!
    
    var arrayOfAllGroups: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupNavBar.delegate = self
        groupTableView.delegate = self
        groupTableView.dataSource = self
    }
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached
    }
    
    // MARK: Constants
    private struct Constants
    {
        // Segue Identifiers
        static let JoinGroup = "JoinGroup"
        static let CreateGroup = "CreateGroup"
        
        // Reuseable Cell Name
        static let TableViewCell = "GroupCell"
        
        // Deletion Title Name
        static let DeleteTitle = "Leave Group"

    }
    
    enum Alerts {
        case LeaveGroupAlert
    }
    
    // MARK: TableView Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // for testing
        return arrayOfAllGroups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell, forIndexPath: indexPath)
        
        let row = indexPath.row
        
        // for testing
        cell.textLabel?.text = arrayOfAllGroups[row]
    
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        arrayOfAllGroups.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return Constants.DeleteTitle
    }
    
}



extension UIViewController
{
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController!
        } else {
            return self
        }
    }
}

