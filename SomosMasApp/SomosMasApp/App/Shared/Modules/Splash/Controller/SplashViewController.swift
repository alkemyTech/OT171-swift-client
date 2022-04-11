//
//  SplashViewController.swift
//  SomosMasApp
//
//  Created by Hilario Cuervo on 29/03/2022.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.loader.stopAnimating()
            
                let homeViewController = TabBarViewController()
                let logInViewController = logInViewController()
                if let _ = self.defaults.string(forKey: "token"){
                    self.navigationController?.pushViewController(homeViewController, animated: true)
                } else {
                    self.navigationController?.pushViewController(logInViewController, animated: true)
                }
        }
    }
}
