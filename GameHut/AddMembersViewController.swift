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
class AddMembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    
    
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var memberTableView: UITableView!
    
    var groupStateController = GroupStateController()
    var localMemberStateController = LocalMemberStateController()
    var helper = AddMemberVCHelper()
    var addMembersToCreateGroup: AddMembersToCreateGroup?

    var listArray: [Array<String>] = []
    // example output[["J", "James Smith|4"], ["L", "Laura Michaels|3"]] //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AddMembersViewController.dismissKeyboard)))
        memberTableView.delegate = self
        memberTableView.dataSource = self
        listArray = helper.sortNames()
        // nameLabel("Hey", displayViewX: displayView.frame.origin.x)
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
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func nameLabel(name: String, displayViewX: CGFloat) {
        let getDisplayViewX = displayViewX
        let getDisplayViewY = displayView.frame.origin.y
        
        let label = UILabel(frame: CGRectMake(getDisplayViewX, getDisplayViewY, 200, 21))
        label.textAlignment = NSTextAlignment.Center
        label.text = name
        self.displayView.addSubview(label)
        
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
        
        // searchAndAddMemberView.textColor = colorPicker(0.0, green: 206.0, blue: 209.0, alpha: 1.0) // dark turquoise
        let arrayMember = listArray[indexPath.section][indexPath.row + 1]
        let pipeIndex = parseName(arrayMember)
        
        // var oldText = displayView.textInputMode
        let addedText = arrayMember.substringToIndex(arrayMember.startIndex.advancedBy(pipeIndex! - 1))
        
        let memberArray = helper.screenedMembers
        for member in memberArray {
            if addedText == member.name {
                print(member.name)
                addMembersToCreateGroup?.addPotentialMember(member)
                // delete member if textView shows member is deleted
            }
        }
        /*
        if oldText == Constants.searchAndAddMemberViewPlaceholderText {
            // searchAndAddMemberView.text = ""
            oldText = ""
        }
        
        if oldText == "" {
            // searchAndAddMemberView.text = addedText + ", "
        } else {
            // searchAndAddMemberView.text = oldText + addedText + ", "
        }*/
    }
    
    
    
}
