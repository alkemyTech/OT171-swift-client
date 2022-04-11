//
//  NosotrosViewController.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 07/04/2022.
//

import UIKit


struct NosotrosData {
    let image: UIImage?
    let name: String?
    let jobTitle: String?
    
}

let margin: CGFloat = 10

class NosotrosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    let nosotrosData = [ NosotrosData(image: UIImage(named:"Image_1"), name: "Juan Perez", jobTitle: "Gerente"),
                         NosotrosData(image: UIImage(named:"Image_2"), name: "Pablo Sanchez", jobTitle: "Gerente"),
                         NosotrosData(image: UIImage(named:"Image_3"), name: "Marta Diaz", jobTitle: "Gerente"),
                         
                          ]
    
    @IBOutlet var nosotrosCollectionView: UICollectionView!
    
    let dataArray = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nosotrosCollectionView.delegate = self
        self.nosotrosCollectionView.dataSource = self
        
        nosotrosCollectionView.register(UINib(nibName: "NosotrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "nosotrosCell")
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nosotrosCell", for: indexPath) as? NosotrosCollectionViewCell
        
        
        
        return cell ?? NosotrosCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let columnCount = 3
        let width  = (Int(view.frame.width) - 20) / columnCount
        return CGSize(width: width, height: width)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
