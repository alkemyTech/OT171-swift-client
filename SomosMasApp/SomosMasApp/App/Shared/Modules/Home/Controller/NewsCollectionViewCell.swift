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
    @IBOutlet weak var newsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsDescription.font = UIFont.boldSystemFont(ofSize: 20)
        newsButton.isHidden = true
    }

    @IBAction func newsButtonTapped(_ sender: Any) {
        print("Prueba del button. Aqui se realizará otra acción.")
    }
    
}
