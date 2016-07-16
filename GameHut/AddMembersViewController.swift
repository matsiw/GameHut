//
//  AddMembersViewController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/15/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import UIKit

// get contacts from "people you've been in a group with before", "in contact phone list", "from My Friends list"

class AddMembersViewController: UIViewController, UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var friendNavBar: UINavigationBar!
    
    
    let randomArray: [String] = ["Sam", "James"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendNavBar.delegate = self
        memberTableView.delegate = self
        memberTableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private struct Constants {
        
        // Reuseable Cell Name
        static let TableViewCell = "FriendCell"
    }
    
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.TopAttached
    }
    

    // MARK: TableView Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // for testing
        return randomArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell, forIndexPath: indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = randomArray[row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

}
