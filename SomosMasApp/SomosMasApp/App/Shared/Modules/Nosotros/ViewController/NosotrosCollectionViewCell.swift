//
//  NosotrosCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 11/04/2022.
//

import UIKit

class NosotrosCollectionViewCell: UICollectionViewCell {

    @IBOutlet var photo: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var jobTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
