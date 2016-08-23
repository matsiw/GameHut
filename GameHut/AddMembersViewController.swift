//
//  AddMembersViewController.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/15/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import UIKit

protocol AddMembersToCreateGroup {
    func addPotentialMember(member: MemberModel)
    func deletePotentialMember(member: MemberModel)
}

// get contacts from "people you've been in a group with before" (recents) and "from My Friends list"
class AddMembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate
{
    
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var searchAndAddMemberView: UITextView!
    
    var groupStateController = GroupStateController()
    var localMemberStateController = LocalMemberStateController()
    var helper = AddMemberVCHelper()
    var addMembersToCreateGroup: AddMembersToCreateGroup?

    var listArray: [Array<String>] = []
    // example output[["J", "James Smith|4"], ["L", "Laura Michaels|3"]] //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberTableView.delegate = self
        memberTableView.dataSource = self
        searchAndAddMemberView.delegate = self
        listArray = helper.sortNames()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memberTableView.reloadData()
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
    
    private func parseName(arrayMember: String) -> Int? {

        var pipeIndex: Int?
        firstLoop: for section in listArray {
            for name in section {
                if name == arrayMember {
                    for index in name.characters.indices {
                        // name and ID seperated by | symbol
                        if name[index] == "|" {
                            pipeIndex = name.startIndex.distanceTo(index) + 1
                            return pipeIndex!
                        }
                    }
                }
            }
        }
        return pipeIndex
    }
    

    // MARK: TableView Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return listArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // for testing
        return listArray[section].count - 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell, forIndexPath: indexPath)
        
        let arrayMember = listArray[indexPath.section][indexPath.row + 1]
        let pipeIndex = parseName(arrayMember)
        
        cell.textLabel?.text = arrayMember.substringToIndex(arrayMember.startIndex.advancedBy(pipeIndex! - 1))
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listArray[section][0]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        searchAndAddMemberView.textColor = colorPicker(0.0, green: 206.0, blue: 209.0, alpha: 1.0) // dark turquoise
        let arrayMember = listArray[indexPath.section][indexPath.row + 1]
        let pipeIndex = parseName(arrayMember)
        
        var oldText = searchAndAddMemberView.text
        let addedText = arrayMember.substringToIndex(arrayMember.startIndex.advancedBy(pipeIndex! - 1))
        
        let memberArray = helper.screenedMembers
        for member in memberArray {
            if addedText == member.name {
                print(member.name)
                addMembersToCreateGroup?.addPotentialMember(member)
                // delete member if textView shows member is deleted
            }
        }
        
        if oldText == Constants.searchAndAddMemberViewPlaceholderText {
            searchAndAddMemberView.text = ""
            oldText = ""
        }
        
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
