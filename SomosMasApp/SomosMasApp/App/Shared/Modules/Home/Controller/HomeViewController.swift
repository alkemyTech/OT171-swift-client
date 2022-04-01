//
//  HomeViewController.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 29/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    struct SliderData {
        let title: String?
        let description: String?
        let image: UIImage?
    }
    
    let sliderData = [ SliderData(title: "Marcelo Aguirre", description: "Presidente", image: UIImage(named:"Image_1")),
                       SliderData(title: "Lucas Ocampo", description: "RRHH", image: UIImage(named:"Image_2")),
                       SliderData(title: "Guillermo Costa", description: "Contador", image: UIImage(named:"Image_3")),
                       SliderData(title: "Victoria Sanchez", description: "Tesorera", image: UIImage(named:"Image_4")),
                       SliderData(title: "Martina Diglido", description: "Marketing", image: UIImage(named:"Image_5"))
                     ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testimoniosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        testimoniosCollectionView.isPagingEnabled = true
        testimoniosCollectionView.dataSource = self
        testimoniosCollectionView.delegate = self
        testimoniosCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        testimoniosCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        
    }
    
}
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? HomeCollectionViewCell
        
        cell?.myTitle.text = sliderData[indexPath.row].title
        cell?.myImage.image = sliderData[indexPath.row].image
        cell?.myDescription.text = sliderData[indexPath.row].description

        return cell ?? HomeCollectionViewCell()
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width)
        let cellHeight = floor(screenSize.height)

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
