//
//  NewsCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Mariano Battaglia on 01/04/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsDescription.font = UIFont.boldSystemFont(ofSize: 20)
    }

}
