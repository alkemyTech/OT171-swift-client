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
    
    struct TestimoniosData {
        let image: UIImage?
        let epigrafe: String?
    }
    
    struct LastestNewsData {
        let image: UIImage?
        let epigraph: String?
    }
    
    let sliderData = [ SliderData(title: "Marcelo Aguirre", description: "Presidente", image: UIImage(named:"Image_1")),
                       SliderData(title: "Lucas Ocampo", description: "RRHH", image: UIImage(named:"Image_2")),
                       SliderData(title: "Guillermo Costa", description: "Contador", image: UIImage(named:"Image_3")),
                       SliderData(title: "Victoria Sanchez", description: "Tesorera", image: UIImage(named:"Image_4")),
                       SliderData(title: "Martina Diglido", description: "Marketing", image: UIImage(named:"Image_5"))
                     ]
    
    let testimoniosData = [ TestimoniosData(image: UIImage(named:"Image_1"), epigrafe: "Epígrafe requerido para esta imagen"),
                            TestimoniosData(image: UIImage(named:"Image_2"), epigrafe: "Epígrafe requerido para esta imagen"),
                            TestimoniosData(image: UIImage(named:"Image_3"), epigrafe: "Epígrafe requerido para esta imagen"),
                            TestimoniosData(image: UIImage(named:"Image_4"), epigrafe: "Epígrafe requerido para esta imagen"),
                            TestimoniosData(image: UIImage(named:"Image_5"), epigrafe: "Epígrafe requerido para esta imagen"),
                            TestimoniosData(image: UIImage(named:"Image_6"), epigrafe: "Epígrafe requerido para esta imagen")
                          ]
    
    let lastestNewsData = [ LastestNewsData(image: UIImage(named:"Image_1"), epigraph: "Epígrafe 1"),
                            LastestNewsData(image: UIImage(named:"Image_2"), epigraph: "Epígrafe 2"),
                            LastestNewsData(image: UIImage(named:"Image_3"), epigraph: "Epígrafe 3"),
                            LastestNewsData(image: UIImage(named:"Image_4"), epigraph: "Epígrafe 4"),
                            LastestNewsData(image: UIImage(systemName: "chevron.right.circle"), epigraph: nil)
                          ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testimoniosCollectionView: UICollectionView!
    @IBOutlet weak var lastestNewsCollectionView: UICollectionView!
    
    
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
        testimoniosCollectionView.register(UINib(nibName: "TestimoniosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Tcell")
        
        //lastest news
        lastestNewsCollectionView.isPagingEnabled = true
        lastestNewsCollectionView.dataSource = self
        lastestNewsCollectionView.delegate = self
        lastestNewsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        lastestNewsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newscell")
    }
    
}
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return sliderData.count
        } else if collectionView == self.testimoniosCollectionView {
                return testimoniosData.count
        } else if collectionView == self.lastestNewsCollectionView {
            return lastestNewsData.count
            }
            return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? HomeCollectionViewCell
            
            cell?.myTitle.text = sliderData[indexPath.row].title
            cell?.myImage.image = sliderData[indexPath.row].image
            cell?.myDescription.text = sliderData[indexPath.row].description

            return cell ?? HomeCollectionViewCell()
        } else if collectionView == self.testimoniosCollectionView {
            let cell2 = testimoniosCollectionView.dequeueReusableCell(withReuseIdentifier: "Tcell", for: indexPath) as? TestimoniosCollectionViewCell
            
            cell2?.testimonioImage.image = testimoniosData[indexPath.row].image
            cell2?.testimonioEpigrafe.text = testimoniosData[indexPath.row].epigrafe
            
            return cell2 ?? TestimoniosCollectionViewCell()
        } else if collectionView == self.lastestNewsCollectionView { // lastestnews
            let cell3 = lastestNewsCollectionView.dequeueReusableCell(withReuseIdentifier: "newscell", for: indexPath) as? NewsCollectionViewCell
            
            cell3?.newsImage.image = lastestNewsData[indexPath.row].image
            cell3?.newsDescription.text = lastestNewsData[indexPath.row].epigraph
            return cell3 ?? NewsCollectionViewCell()
        }
        
        return UICollectionViewCell()
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width)
        let cellHeight = floor(screenSize.height)

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func testimoniosCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize = testimoniosCollectionView.frame.size
        let cellWidth = floor(screenSize.width)
        let cellHeight = floor(screenSize.height)

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
