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

    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTableView.dataSource = self
        //trendingTableView.delegate = self
        Task {
            self.trendingMovies = await Movie.trendingTodayMovies()
            self.trendingTableView.reloadData()
            
        }
        // Do any additional setup after loading the view.
    }
    

}
