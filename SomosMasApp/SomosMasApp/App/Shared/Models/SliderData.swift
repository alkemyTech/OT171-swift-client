//
//  SliderData.swift
//  SomosMasApp
//
//  Created by Braian Theiler on 29/03/2022.
//

import Foundation
import UIKit

struct SliderData {
    let title: String?
    let description: String?
    let image: UIImage?
}

let sliderData = [ SliderData(title: "Marcelo Aguirre", description: "Presidente", image: UIImage(named:"Image_1")),
                   SliderData(title: "Micaela Ocampo", description: "RRHH", image: UIImage(named:"Image_2")),
                   SliderData(title: "Guillermo Costa", description: "Contador", image: UIImage(named:"Image_3")),
                   SliderData(title: "Victoria Sanchez", description: "Tesorera", image: UIImage(named:"Image_4")),
                   SliderData(title: "Martina Diglido", description: "Marketing", image: UIImage(named:"Image_5"))
                 ]

