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
    
    struct TestimonialsData {
        let image: UIImage?
        let epigraph: String?
    }
    
    let sliderData = [ SliderData(title: "Marcelo Aguirre", description: "Presidente", image: UIImage(named:"Image_1")),
                       SliderData(title: "Lucas Ocampo", description: "RRHH", image: UIImage(named:"Image_2")),
                       SliderData(title: "Guillermo Costa", description: "Contador", image: UIImage(named:"Image_3")),
                       SliderData(title: "Victoria Sanchez", description: "Tesorera", image: UIImage(named:"Image_4")),
                       SliderData(title: "Martina Diglido", description: "Marketing", image: UIImage(named:"Image_5"))
                     ]
    
    var testimonialsData = [ TestimonialsData(image: UIImage(named:"Image_6"), epigraph: "Epígrafe requerido para esta imagen"),
                            TestimonialsData(image: UIImage(named:"Image_7"), epigraph: "Epígrafe requerido para esta imagen"),
                          ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testimonialsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        
        testimonialsCollectionView.isPagingEnabled = true
        testimonialsCollectionView.dataSource = self
        testimonialsCollectionView.delegate = self
        testimonialsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        testimonialsCollectionView.register(UINib(nibName: "TestimonialsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Tcell")
        testimonialsCollectionView.register(UINib(nibName: "SeeMoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "seeMoreCell")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.testimonialsCollectionView:
            // Return Max pages = 4 and add 1 more for item "Ver más"
            return min(testimonialsData.count + 1, 5)
        // Here can be added news cases
        default:
            return sliderData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case testimonialsCollectionView:
            // Add seeMore page
            if indexPath.row == min(testimonialsData.count, 4) {
                let cell = testimonialsCollectionView.dequeueReusableCell(withReuseIdentifier: "seeMoreCell", for: indexPath) as? SeeMoreCollectionViewCell
                
                return cell ?? SeeMoreCollectionViewCell()
            } else {
            let cell = testimonialsCollectionView.dequeueReusableCell(withReuseIdentifier: "Tcell", for: indexPath) as? TestimonialsCollectionViewCell
            
            cell?.testimonialImage.image = testimonialsData[indexPath.row].image
            cell?.testimonialEpigraph.text = testimonialsData[indexPath.row].epigraph
            
            return cell ?? TestimonialsCollectionViewCell()
            }
        //Here can be added news cases
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? HomeCollectionViewCell
            
            cell?.myTitle.text = sliderData[indexPath.row].title
            cell?.myImage.image = sliderData[indexPath.row].image
            cell?.myDescription.text = sliderData[indexPath.row].description

            return cell ?? HomeCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
        switch collectionView {
        case testimonialsCollectionView:
            if indexPath.row == min(testimonialsData.count, 4) {
                // Add an action when the item is selected
            }
        default:
            break
        }
        
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
