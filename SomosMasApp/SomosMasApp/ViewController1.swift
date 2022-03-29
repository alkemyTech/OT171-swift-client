//
//  ViewController.swift
//  SomosMasApp
//
//  Created by Fran Nasich on 16/03/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("La URL que se encuentra en la variable de entorno es:")
        let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
        print(webserviceURL)
    }


}

