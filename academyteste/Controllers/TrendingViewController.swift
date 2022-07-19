//
//  TrendingViewController.swift
//  academyteste
//
//  Created by bamcc on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    @IBOutlet var trendingTableView: UITableView!
    
    var trendingMovies: [Movie] = []
    @IBOutlet var trendingSegmentedControl: UISegmentedControl!
    @IBAction func touchTrendingSegmentedControl(_ sender: Any) {
        if trendingSegmentedControl.selectedSegmentIndex == 0 {
            Task {
                self.trendingMovies = await Movie.trendingDayMoviesAPI()
                self.trendingTableView.reloadData()
            }
        } else if trendingSegmentedControl.selectedSegmentIndex == 1 {
            Task{
                self.trendingMovies = await Movie.trendingWeekMoviesAPI()
                self.trendingTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingTableView.dataSource = self
        //trendingTableView.delegate = self
        Task {
            self.trendingMovies = await Movie.trendingDayMoviesAPI()
            self.trendingTableView.reloadData()
            
        }
        // Do any additional setup after loading the view.
    }
    
    
}
