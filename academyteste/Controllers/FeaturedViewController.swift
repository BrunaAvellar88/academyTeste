//
//  FeaturedViewController.swift
//  academyteste
//
//  Created by bamcc on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
  
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        sleep(2)
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
        Task {
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        Task{
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Passar o filme adiante
                if segue.identifier == "detailsSegue"{
                    if let destination = segue.destination as? DetailsViewController{
                        let movie = sender as? Movie
                        destination.movie = movie
                    }
                }
                else if segue.identifier == "seeAllPopular" {
                    if let destination = segue.destination as? SeeAllViewController{
                        destination.seeAllMovies = popularMovies
                    }
                }
                else if segue.identifier == "seeAllNowPlaying" {
                    if let destination = segue.destination as? SeeAllViewController{
                        destination.seeAllMovies = nowPlayingMovies
                    }
                }
                else if segue.identifier == "seeAllUpcoming" {
                    if let destination = segue.destination as? SeeAllViewController{
                        destination.seeAllMovies = upcomingMovies
                    }
                }
            }
}
    
    

