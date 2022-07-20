//
//  TrendingViewController+UITableViewDelegate.swift
//  academyteste
//
//  Created by bamcc on 19/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie
                
        if tableView == trendingTableView {
            movie = trendingMovies[indexPath.item]
        } else {
            return
        }
                
        performSegue(withIdentifier: "detailsShow", sender: movie)
            
    }
}
