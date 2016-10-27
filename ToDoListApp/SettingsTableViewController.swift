//
//  SettingsTableViewController.swift
//  ToDoListApp
//
//  Created by Navya Rekapally on 10/26/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var settingsArr = ["About", "FAQs", "Contact Us"]
    
    var heading1 = ["App Designers: Navya & Madhura",
                    "Are all the movies here are for kids?",
                    "Feel free to reach us for any support at: iossupport@deanza.edu"]
    
    var heading2 = ["App Designers: Navya & Madhura",
                    "Absolutely!! All the movies here are specially meant for kids",
                    "iossupport@deanza.edu"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsArr.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "settings"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = settingsArr[indexPath.row]

        return cell
    }

    
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    
//
//    
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        heading1.removeAtIndex(indexPath.row)
//        heading2.removeAtIndex(indexPath.row)
//        
//    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "settingsDetails")
        {
            if let indPath = self.tableView.indexPathForSelectedRow
            {
                let detailViewController = segue.destinationViewController as! MySettingDetailsViewController
                
                detailViewController.str1 = heading1[indPath.row]
                detailViewController.str2 = heading2[indPath.row]
                
            }
        }
    }


}
