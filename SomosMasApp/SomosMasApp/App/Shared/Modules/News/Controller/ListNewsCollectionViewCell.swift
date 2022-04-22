//
//  ListNewsCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 20/04/2022.
//

import UIKit

class ListNewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        title.adjustsFontSizeToFitWidth = true
    }

}
