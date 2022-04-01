//
//  HomeCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 29/03/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        myTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }

}
