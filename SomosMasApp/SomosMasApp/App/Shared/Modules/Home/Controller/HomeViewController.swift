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
        
    let lastestNewsData = [ LastestNewsData(image: UIImage(named:"Image_1"), epigraph: "Epígrafe para imagen 1"),
                            LastestNewsData(image: UIImage(named:"Image_2"), epigraph: "Epígrafe para imagen 2"),
                            LastestNewsData(image: UIImage(named:"Image_3"), epigraph: "Epígrafe para imagen 3"),
                            LastestNewsData(image: UIImage(named:"Image_4"), epigraph: "Epígrafe para imagen 4")
                          ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lastestNewsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        lastestNewsCollectionView.isPagingEnabled = true
        lastestNewsCollectionView.dataSource = self
        lastestNewsCollectionView.delegate = self
        lastestNewsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        lastestNewsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newscell")
        lastestNewsCollectionView.register(UINib(nibName: "SeeMoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "seeMoreCell")

        let backButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeApp))
        self.navigationItem.leftBarButtonItem  = backButton
    }
    @objc func closeApp() {
        exit(0)

    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.lastestNewsCollectionView:
            // Return Max pages = 4 and add 1 more for item "Ver más".
            return min(lastestNewsData.count + 1, 5)
        default:
            return sliderData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case lastestNewsCollectionView:
            if indexPath.row == min(lastestNewsData.count, 4) {
                let cell = lastestNewsCollectionView.dequeueReusableCell(withReuseIdentifier: "seeMoreCell", for: indexPath) as? SeeMoreCollectionViewCell

                return cell ?? SeeMoreCollectionViewCell()
            } else {
            let cell = lastestNewsCollectionView.dequeueReusableCell(withReuseIdentifier: "newscell", for: indexPath) as? NewsCollectionViewCell
            
            cell?.newsImage.image = lastestNewsData[indexPath.row].image
            cell?.newsDescription.text = lastestNewsData[indexPath.row].epigraph
            
            return cell ?? NewsCollectionViewCell()
            }
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
        case lastestNewsCollectionView:
            if indexPath.row == min(lastestNewsData.count, 4) {
                // Add an action when "ver Más" item from "Ultimas novedades" is selected
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
