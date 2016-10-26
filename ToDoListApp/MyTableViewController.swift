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
    
    
    var MovieGenre = ["Genre: Animation/ Kids & Family", "Genre: Animation/ Comedy/ kids & Family", "Genre: Action & Adventure/ Animation/ Comedy",
                      "Genre: Animation/ Kids & Family/ Sci-Fi/ Fantasy", "Genre: Animation/ Comedy/ Kids & Family", "Genre: Drama/ Animation/ Fantasy/ Sci-Fi",
                      "Genre: Animation/ Comedy/ Fantasy", "Genre: Animation/Drama/ Romance", "Genre: Action & Adventure/ Drama", "Genre: Action & Adventure/ Kids & Family", "Genre: Animation/ Kids & Family/ Sci-Fi", "Genre: Animation/ Kids & Family", "Genre: Animation/ Fantasy/ Romance",
                      "Genre: Scr-Fi/ Animation/ Adventure", "Genre: Animation/ Comedy", "Genre: Animation/ Fantasy", "Genre: Animation", "Genre: Animation", "Genre: Animation",
                      "Genre: Action/ Animation/ Comedy", "Genre: Fairy tale/ Fantasy/ Romance", "Genre: Picture book/ Fairy tale/ Children’s literature",
                      "Genre: Action/ Family/ Drama/ Adventure", "Genre: Adventure/ Animation/ Family", "Genre: Animation/ Comedy/ Action/ Family"]
    
    
    var MovieYear = ["Year:   2015", "Year:   2003", "Year:   2014", "Year:   2010", "Year:   2004", "Year:   2001", "Year:   2001", "Year:   1991", "Year:   1994", "Year:   1992", "Year:   1998", "Year:   2013", "Year:   1988", "Year:   1968", "Year:   2015",
                     "Year:   2016", "Year:   2016", "Year:   2011", "Year:   2002", "Year:   1997", "Year:   2009", "Year:   2011", "Year:   2005", "Year:   2015", "Year:   2014"]
    var MovieRating = ["Rated: G", "Rated: G", "Rated: PG", "Rated: PG", "Rated: PG", "Rated: PG", "Rated: G", "Rated: G", "Rated: G", "Rated: G", "Rated: G", "Rated: PG", "Rated: G", "Rated: G",
                       "Rated: PG", "Rated: PG", "Rated: PG", "Rated: G", "Rated: PG", "Rated: G", "Rated: G", "Rated: PG", "Rated: PG", "Rated: G", "Rated: PG"]

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
    
    


