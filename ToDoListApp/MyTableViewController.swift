//
//  MyTableViewController.swift
//  ToDoListApp
//
//  Created by Navya Rekapally on 10/21/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var Movies = ["Alladin", "A Bug's Life", "Beauty and the Beast", "Big Hero 6", "Finding Nemo", "Frozen",
                  "Hercules", "How to Train your Dragon", "Howl's Moving Castle", "Inside Out",  "Lilo and Stitch", "Monsters Inc",
                  "Pete's Dragon", "Puss in Boots",  "Shaun The Sheep", "Spirited Away", "The Incredibles", "The Lego Movie",
                  "The Lion King",  "The Little Mermaid", "The Little Prince", "The Peanuts's Movie", "The Princess and the Frog",
                  "The Yellow Submarine", "Winnie the Pooh"]
    
    
    var MovieImage = ["alladin.jpg", "bugsLife.jpg", "beautyAndTheBeast.jpg", "bigHero.jpg", "nemo.jpg", "frozen.jpg",
                      "hercules.jpg", "trainDragon.jpg", "howls.jpg", "insideOut.jpg", "lilo.jpg", "monsters.jpg",
                      "petesDragon.jpg", "puss.jpg", "shaunTheSheep", "spiritedAway.jpg", "incredibles.jpg", "lego.jpg",
                      "lionKing.jpg", "mermaid.jpg", "littlePrince.jpg", "peanuts.jpg", "princess.jpg",
                      "submarine.jpg", "winnie.jpg"]
    
    var MovieGenre = ["Action & Adventure/ Kids & Family", "Animation/ Kids & Family/ Sci-Fi", "Animation/Drama/ Romance",
                      "Animation/ Comedy/ Action/ Family", "Animation/ Comedy/ kids & Family", "Animation/ Kids & Family",
                      "Action/ Animation/ Comedy", "Animation/ Kids & Family/ Sci-Fi/ Fantasy", "Action/ Family/ Drama/ Adventure",
                      "Animation/ Kids & Family", "Animation", "Animation/ Comedy/ Fantasy", "Animation",
                      "Picture book/ Fairy tale/ Children’s literature", "Animation/ Comedy", "Drama/ Animation/ Fantasy/ Sci-Fi",
                      "Animation/ Comedy/ Kids & Family", "Action & Adventure/ Animation/ Comedy", "Action & Adventure/ Drama",
                      "Animation/ Fantasy/ Romance", "Sci-Fi/ Animation/ Adventure",
                      "Adventure/ Animation/ Family", "Fairy tale/ Fantasy/ Romance", "Animation/ Fantasy", "Animation" ]
    
    
    var MovieYear = ["1992", "1998", "1991", "2014", "2003", "2013",
                     "1997", "2010", "2005", "2015",  "2002", "2001",
                     "2016", "2011", "2015", "2001", "2004", "2014",
                     "1994", "1988", "2016", "2015", "2009",
                     "1968", "2011" ]
    
    
    var MovieRating = ["G", "G", "G", "PG", "G", "PG",
                       "G", "PG", "PG", "G", "PG", "G",
                       "PG", "PG", "PG", "PG", "PG", "PG",
                       "G", "G", "PG", "G", "G",
                       "G", "G"]
    
    var CheckState = [false, false, false, false, false, false, false, false, false, false, false, false,
                      false, false, false, false, false, false, false, false, false, false, false, false, false]

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
        //let msgAlert = UIAlertView(title: "Row Selected", message: selectedItem, delegate: nil, cancelButtonTitle: "ok")
        //msgAlert.show()
        
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
    
    


