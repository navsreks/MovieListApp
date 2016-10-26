//
//  MyTableViewController.swift
//  ToDoListApp
//
//  Created by Navya Rekapally on 10/21/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var Movies = ["Inside Out", "Finding Nemo", "The Lego Movie", "How to Train your Dragon", "The Incredibles", "Spirited Away",
                  "Monsters Inc", "Beauty and the Beast", "The Lion King", "Alladin", "A Bug's Life", "Frozen", "The Little Mermaid",
                  "The Yellow Submarine", "Shaun The Sheep", "The Little Prince", "Pete's Dragon", "Winnie the Pooh", "Lilo and Stitch",
                  "Hercules", "The Princess and the Frog", "Puss in Boots", "Howl's Moving Castle", "The Peanuts's Movie", "Big Hero 6"]
    
    
    var MovieImage = ["insideOut.jpg", "nemo.jpg", "lego.jpg", "trainDragon.jpg", "incredibles.jpg", "spiritedAway.jpg",
                      "monsters.jpg", "beautyAndTheBeast.jpg", "lionKing.jpg", "alladin.jpg", "bugsLife.jpg", "frozen.jpg", "mermaid.jpg",
                      "submarine.jpg", "shaunTheSheep", "littlePrince.jpg", "petesDragon.jpg", "winnie.jpg", "lilo.jpg",
                      "hercules.jpg", "princess.jpg", "puss.jpg", "howls.jpg", "peanuts.jpg", "bigHero.jpg"]
    
    
    var MovieGenre = ["Animation/ Kids & Family", "Animation/ Comedy/ kids & Family", "Action & Adventure/ Animation/ Comedy",
                      "Animation/ Kids & Family/ Sci-Fi/ Fantasy", "Animation/ Comedy/ Kids & Family", "Drama/ Animation/ Fantasy/ Sci-Fi",
                      "Animation/ Comedy/ Fantasy", "Animation/Drama/ Romance", "Action & Adventure/ Drama", "Action & Adventure/ Kids & Family", "Animation/ Kids & Family/ Sci-Fi", "Animation/ Kids & Family", "Animation/ Fantasy/ Romance",
                      "Scr-Fi/ Animation/ Adventure", "Animation/ Comedy", "Animation/ Fantasy", "Animation", "Animation", "Animation",
                      "Action/ Animation/ Comedy", "Fairy tale/ Fantasy/ Romance", "Picture book/ Fairy tale/ Children’s literature",
                      "Action/ Family/ Drama/ Adventure", "Adventure/ Animation/ Family", "Animation/ Comedy/ Action/ Family"]
    
    
    var MovieYear = ["2015", "2003", "2014", "2010", "2004", "2001", "2001", "1991", "1994", "1992", "1998", "2013", "1988", "1968", "2015",
                     "2016", "2016", "2011", "2002", "1997", "2009", "2011", "2005", "2015", "2014"]
    var MovieRating = ["G", "G", "PG", "PG", "PG", "PG", "G", "G", "G", "G", "G", "PG", "G", "G",
                       "PG", "PG", "PG", "G", "PG", "G", "G", "PG", "PG", "G", "PG"]

    var CheckState = [false, false, false, false, false, true, true, true, false, false, false, false,
                      false, false, false, false, false, true, true, true, false, false, false, false, true]

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
        cell.cellItemName.numberOfLines = 2
        cell.cellItemName?.text = Movies[indexPath.row]
        cell.cellImage?.image = UIImage(named: MovieImage[indexPath.row])
       // cell.cellItemType?.text = MovieGenre[indexPath.row]

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
    
    


