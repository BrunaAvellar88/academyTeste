//
//  TrendingTableViewCell.swift
//  academyteste
//
//  Created by bamcc on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static let cellIdentifier = "trendingCell"
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup (title: String, imagem: UIImage, year: String){
        titleLabel.text = title
        self.imagem.image = imagem
        dateLabel.text = year
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
