//
//  AddMembersViewController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/15/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import UIKit

// get contacts from "people you've been in a group with before" (recents) and "from My Friends list"

class AddMembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate
{
    
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var searchAndAddMemberView: UITextView!
    
    var groupStateController = GroupStateController()
    var localMemberStateController = LocalMemberStateController()

    let randomArray: [Array<String>] = [["J", "James Smith"], ["L", "Laura Michaels"]]
    //////////// change to get members from MemberSearchHelper
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberTableView.delegate = self
        memberTableView.dataSource = self
        searchAndAddMemberView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private struct Constants {
        
        // Reuseable Cell Name
        static let TableViewCell = "FriendCell"
        
        // searchAndAddMemberView placeholder text
        static let searchAndAddMemberViewPlaceholderText = "Type a name or phone number"
    }
    

    // MARK: TableView Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return randomArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // for testing
        return randomArray[section].count - 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell, forIndexPath: indexPath)
        
        cell.textLabel?.text = randomArray[indexPath.section][indexPath.row + 1]
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return randomArray[section][0]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var oldText = searchAndAddMemberView.text
        let addedText = randomArray[indexPath.section][indexPath.row + 1] + " " + randomArray[indexPath.section][indexPath.row]
        
        if oldText == Constants.searchAndAddMemberViewPlaceholderText {
            searchAndAddMemberView.text = ""
            oldText = ""
        }
        
        searchAndAddMemberView.textColor = colorPicker(0.0, green: 206.0, blue: 209.0, alpha: 1.0) // dark turquoise
        
        if oldText == "" {
            searchAndAddMemberView.text = addedText + ", "
        } else {
            searchAndAddMemberView.text = oldText + addedText + ", "
        }
    }
    
    
    // MARK: TextView Methods
    
    func textViewDidBeginEditing(textView: UITextView) {
        if searchAndAddMemberView.text == Constants.searchAndAddMemberViewPlaceholderText {
            searchAndAddMemberView.text = ""
        }
        searchAndAddMemberView.textColor = colorPicker(0.0, green: 206.0, blue: 209.0, alpha: 1.0) // dark turquoise
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if searchAndAddMemberView.text == "" {
            searchAndAddMemberView.textColor = UIColor.lightGrayColor()
            searchAndAddMemberView.text = Constants.searchAndAddMemberViewPlaceholderText
        }
    }
    

}
