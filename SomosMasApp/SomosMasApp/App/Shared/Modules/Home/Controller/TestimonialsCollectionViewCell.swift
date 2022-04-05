//
//  TestimonialsCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 01/04/2022.
//

import UIKit

class TestimonialsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var testimonialImage: UIImageView!
    @IBOutlet weak var testimonialEpigraph: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seeMoreButton.isHidden = true
    }

}
