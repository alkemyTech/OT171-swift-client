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
    

    let nosotrosData = [ NosotrosData(image: UIImage(named:"Image_5"), name: "Cecilia Mendez", jobTitle:    "Puesto 1"),
                         NosotrosData(image: UIImage(named:"Image_1"), name: "Juan Perez", jobTitle: "Puesto 2"),
                         NosotrosData(image: UIImage(named:"Image_4"), name: "Maria Garcia", jobTitle: "Puesto 3"),
                         NosotrosData(image: UIImage(named:"Image_5"), name: "Maria Irola", jobTitle: "Puesto 4"),
                         NosotrosData(image: UIImage(named:"Image_4"), name: "Marita Gomez", jobTitle: "Puesto 5"),
                         NosotrosData(image: UIImage(named:"Image_2"), name: "Miriam Diaz", jobTitle: "Puesto 6"),
                         NosotrosData(image: UIImage(named:"Image_3"), name: "Rodrigo Fuente", jobTitle: "Puesto 7")
                          ]
    
    @IBOutlet var nosotrosCollectionView: UICollectionView!
    
    @IBOutlet var TextView: UITextView!
    
    @IBOutlet var textViewHeight: NSLayoutConstraint!
    
    @IBOutlet var collectionViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nosotrosCollectionView.delegate = self
        self.nosotrosCollectionView.dataSource = self
        
       
     //   textViewHeight.constant = self.TextView.contentSize.height
     //   collectionViewHeight.constant = self.nosotrosCollectionView.contentSize.height
        
        nosotrosCollectionView.register(UINib(nibName: "NosotrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "nosotrosCell")
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nosotrosData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nosotrosCell", for: indexPath) as? NosotrosCollectionViewCell
        
        cell?.name.text = nosotrosData[indexPath.row].name
        cell?.jobTitle.text = nosotrosData[indexPath.row].jobTitle
        cell?.photo.image = nosotrosData[indexPath.row].image
        
        
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
