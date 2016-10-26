//
//  MyDetailViewController.swift
//  ToDoListApp
//
//  Created by Navya Rekapally on 10/24/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class MyDetailViewController: UIViewController {

    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var rating: UILabel!
    @IBOutlet var year: UILabel!
    @IBOutlet var genre: UILabel!
    
    var MoviesGenre : String!
    var MoviesYear : String!
    var MoviesRating : String!
    var MoviesImage : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        self.genre.text = "GENRE: " + self.MoviesGenre
        self.year.text = "YEAR: " + self.MoviesYear
        self.rating.text = "RATING: " + self.MoviesRating
        self.movieImage.image = UIImage(named: self.MoviesImage)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
