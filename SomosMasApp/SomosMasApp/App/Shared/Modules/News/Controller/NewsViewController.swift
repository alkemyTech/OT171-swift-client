//
//  NewsViewController.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 08/04/2022.
//

import UIKit

protocol NewsDelegate {
    func reloadSlider()
    func spinnerLoadingState(state: Bool)
}

class NewsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    private let service = NewsService()
    private var viewModel : NewsViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.topViewController?.title = "News"
        self.viewModel = NewsViewModel(service: service, delegate: self)
        self.viewModel?.getNews()
        self.newsCollectionView.delegate = self
        self.newsCollectionView.dataSource = self
        
        newsCollectionView.register(UINib(nibName: "ListNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "newsCell")
        
        spinnerLoadingState(state: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getMembersCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? ListNewsCollectionViewCell
        
        cell?.title.text = viewModel?.getNews(at: indexPath.row).name
        let imagePath = viewModel?.getNews(at: indexPath.row).image
        let imageUrl = URL(string: imagePath!)
        cell?.image.load(url: imageUrl!)
        
        return cell ?? ListNewsCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let columnCount = 2
        let width  = (Int(view.frame.width) - 20) / columnCount
        return CGSize(width: width, height: width)
    }
    

}

extension NewsViewController: NewsDelegate {
    func reloadSlider() {
        self.newsCollectionView.reloadData()
    }
    func spinnerLoadingState(state: Bool) {
        if state == true {
            return self.showSpinner(onView: self.view)
                
        } else {
            return self.removeSpinner()
        }
    }
}
