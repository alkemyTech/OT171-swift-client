//
//  NosotrosViewController.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 07/04/2022.
//

import UIKit

protocol NosotrosDelegate {
    func reloadSlider()
    func spinnerLoadingState(state: Bool)
}

class NosotrosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var nosotrosCollectionView: UICollectionView!
    @IBOutlet var label: UILabel!
    
    private let service = NosotrosService()
    private var viewModel: NosotrosViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = NosotrosViewModel(service: service, delegate: self)
        self.viewModel?.getMembers()
        self.nosotrosCollectionView.delegate = self
        self.nosotrosCollectionView.dataSource = self
        
        label.adjustsFontSizeToFitWidth = true
       
        nosotrosCollectionView.register(UINib(nibName: "NosotrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "nosotrosCell")

    spinnerLoadingState(state: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getMembersCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nosotrosCell", for: indexPath) as? NosotrosCollectionViewCell
        
        cell?.name.text = viewModel?.getMember(at: indexPath.row).name
        cell?.jobTitle.text = viewModel?.getMember(at: indexPath.row).description
        
        let imagePath = viewModel?.getMember(at: indexPath.row).image
        let imageUrl = URL(string: imagePath!)
        cell?.photo.load(url: imageUrl!)
        
        return cell ?? NosotrosCollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let columnCount = 3
        let width  = (Int(view.frame.width) - 20) / columnCount
        return CGSize(width: width, height: width)
    }

}

extension NosotrosViewController: NosotrosDelegate {
    func reloadSlider() {
        self.nosotrosCollectionView.reloadData()
    }
    func spinnerLoadingState(state: Bool) {
        if state == true {
            return self.showSpinner(onView: self.view)
                
        } else {
            return self.removeSpinner()
        }
    }
}
