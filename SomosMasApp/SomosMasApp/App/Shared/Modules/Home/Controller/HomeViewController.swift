//
//  HomeViewController.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 29/03/2022.
//

import UIKit

protocol SliderListDelegate {
    func hideTestimonials()
    func reloadTestimonials()
    func reloadSlider()
    func reloadNews()
    func hideSectionsWithoutData()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var testimonialsTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var testimonialsCollectionView: UICollectionView!
    @IBOutlet weak var lastestNewsCollectionView: UICollectionView!
    @IBOutlet weak var lastestNewsTitleLabel: UILabel!
    
    private let serviceSlider = SliderService()
    private let serviceTestimonials = TestimonialsService()
    private let serviceNews = NewsService()
    private var sliderViewModel: SliderViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sliderViewModel = SliderViewModel(service1: serviceSlider, service2: serviceTestimonials, service3: serviceNews, delegate: self)
        self.sliderViewModel?.getSliders()
        self.sliderViewModel?.getTestimonials()
        self.sliderViewModel?.getNews()
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
        testimonialsCollectionView.isPagingEnabled = true
        testimonialsCollectionView.dataSource = self
        testimonialsCollectionView.delegate = self
        testimonialsCollectionView.register(UINib(nibName: "TestimonialsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Tcell")
        testimonialsCollectionView.register(UINib(nibName: "SeeMoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "seeMoreCell")
        lastestNewsCollectionView.isPagingEnabled = true
        lastestNewsCollectionView.dataSource = self
        lastestNewsCollectionView.delegate = self
        lastestNewsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        lastestNewsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newscell")
        lastestNewsCollectionView.register(UINib(nibName: "SeeMoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "seeMoreCell")
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
        case self.testimonialsCollectionView:
            // Return Max pages = 4 and add 1 more for item "Ver más"
            return min(sliderViewModel!.getTestimonialsCount() + 1, 5)
        case self.lastestNewsCollectionView:
            // Return Max pages = 4 and add 1 more for item "Ver más". Its another case becouse takes data from another Array
            return min(sliderViewModel!.getNewsCount() + 1, 5)
        default:
            return self.sliderViewModel?.getSlidersCount() ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case testimonialsCollectionView:
            // Add seeMore page
            if indexPath.row == min(sliderViewModel!.getTestimonialsCount(), 4) {
                let cell = testimonialsCollectionView.dequeueReusableCell(withReuseIdentifier: "seeMoreCell", for: indexPath) as? SeeMoreCollectionViewCell
                
                return cell ?? SeeMoreCollectionViewCell()
            } else {
            let cell = testimonialsCollectionView.dequeueReusableCell(withReuseIdentifier: "Tcell", for: indexPath) as? TestimonialsCollectionViewCell
                //Add images
                let imagePath = self.sliderViewModel?.getTestimonial(at: indexPath.row).image
                let imageUrl = URL(string: imagePath!)
                
                cell?.testimonialImage.load(url: imageUrl!)
                cell?.testimonialEpigraph.text = sliderViewModel?.getTestimonial(at: indexPath.row).name
                cell?.testimonialDescription.text = sliderViewModel?.getTestimonial(at: indexPath.row).description
                
            return cell ?? TestimonialsCollectionViewCell()
            }
        case lastestNewsCollectionView:
            if indexPath.row == min(sliderViewModel!.getNewsCount(), 4) {
                let cell = lastestNewsCollectionView.dequeueReusableCell(withReuseIdentifier: "seeMoreCell", for: indexPath) as? SeeMoreCollectionViewCell

                return cell ?? SeeMoreCollectionViewCell()
            } else {
            let cell = lastestNewsCollectionView.dequeueReusableCell(withReuseIdentifier: "newscell", for: indexPath) as? NewsCollectionViewCell
            
                let imagePath = self.sliderViewModel?.getNews(at: indexPath.row).image
                let imageUrl = URL(string: imagePath!)
                
                cell?.newsImage.contentMode = .scaleAspectFit
                cell?.newsImage.load(url: imageUrl!)
                cell?.newsDescription.text = sliderViewModel?.getNews(at: indexPath.row).name
                
            return cell ?? NewsCollectionViewCell()
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? HomeCollectionViewCell
            
            cell?.myTitle.text = self.sliderViewModel?.getSliders(at: indexPath.row).name
            cell?.myDescription.text = self.sliderViewModel?.getSliders(at: indexPath.row).description
            
            cell?.myImage.contentMode = .scaleAspectFill
            
            let imagePath = self.sliderViewModel?.getSliders(at: indexPath.row).image
            let imageUrl = URL(string: imagePath!)
            cell?.myImage.load(url: imageUrl!)

            return cell ?? HomeCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
        switch collectionView {
        case testimonialsCollectionView:
            if indexPath.row == min(sliderViewModel!.getTestimonialsCount(), 4) {
                // Add an action when the item is selected
            }
        case lastestNewsCollectionView:
            if indexPath.row == min(sliderViewModel!.getNewsCount(), 4) {
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

extension HomeViewController: SliderListDelegate{
    func hideSectionsWithoutData() {
        if self.sliderViewModel?.getNewsCount() == 0 {
            // Hide section if service doesn't return data
            self.lastestNewsCollectionView.isHidden = true
            self.lastestNewsTitleLabel.isHidden = true
            // Reduce height constraint to zero
            self.lastestNewsCollectionView.heightAnchor.constraint(equalToConstant: 0).isActive = true
            self.lastestNewsTitleLabel.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    func hideTestimonials() {
        self.testimonialsCollectionView.isHidden = true
        self.testimonialsTitleLabel.isHidden = true
    }

    func reloadNews() {
        self.lastestNewsCollectionView.reloadData()
    }

    func reloadTestimonials() {
        self.testimonialsCollectionView.reloadData()
    }
    
    func reloadSlider() {
        self.collectionView.reloadData()
    }
    
}
