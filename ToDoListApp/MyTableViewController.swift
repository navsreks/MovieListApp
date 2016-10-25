//
//  MyTableViewController.swift
//  ToDoListApp
//
//  Created by Navya Rekapally on 10/21/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var Movies = ["groceries", "laundry", "car wash", "homework", "make dinner"]
    var MovieImage = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
    var MovieGenre = ["10:00am", "11:am", "12:30pm", "1:00pm", "2:45pm" ]
    var MovieYear = ["1992", "1983", "1999", "2000", "2011" ]
    var MovieRating = ["G", "PG", "G", "G", "PG" ]

    var CheckState = [false, false, false, false, false]

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
        return Movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ToDoCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MyTableViewCell

        // Configure the cell...
       // cell.textLabel?.text = ToDoItems[indexPath.row]
        //cell.imageView?.image = UIImage(named: "items.jpg")
        cell.cellItemName?.text = Movies[indexPath.row]
        cell.cellImage?.image = UIImage(named: MovieImage[indexPath.row])
        cell.cellItemType?.text = MovieGenre[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = Movies[indexPath.row]
        let msgAlert = UIAlertView(title: "Row Selected", message: selectedItem, delegate: nil, cancelButtonTitle: "ok")
        msgAlert.show()
        
        CheckState[indexPath.row] = !(CheckState[indexPath.row])
        if (CheckState[indexPath.row]){
             self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .DisclosureIndicator
        }
        else {
            self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
        }
       
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        Movies.removeAtIndex(indexPath.row)
        MovieGenre.removeAtIndex(indexPath.row)
MovieImage.removeAtIndex(indexPath.row)
CheckState.removeAtIndex(indexPath.row)

self.tableView.reloadData()

    }
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
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            if (segue.identifier == "ShowMovieDetail")
            {
                if let indPath = self.tableView.indexPathForSelectedRow
                {
                    let detailViewController = segue.destinationViewController as! MyDetailViewController
                    
                    detailViewController.MoviesGenre = MovieGenre[indPath.row]
                    detailViewController.MoviesYear = MovieYear[indPath.row]
                    detailViewController.MoviesRating = MovieRating[indPath.row]
                    detailViewController.MoviesImage = MovieImage[indPath.row]

                    
                    
                }
            }
        }
    }
    
    

