//
//  SplashViewController.swift
//  SomosMasApp
//
//  Created by Hilario Cuervo on 29/03/2022.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            self.loader.stopAnimating()
            
            let alert = UIAlertController(title: "Timer has finished", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                let logInViewController = logInViewController()
                self.navigationController?.pushViewController(logInViewController, animated: true)
            }))
            
            self.present(alert, animated: true)
        }
        
    }

}
