//
//  TestimoniosCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 01/04/2022.
//

import UIKit

class TestimoniosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var testimonioImage: UIImageView!
    @IBOutlet weak var testimonioEpigrafe: UILabel!
    @IBOutlet weak var verMasButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        verMasButton.isHidden = true
    }

}
