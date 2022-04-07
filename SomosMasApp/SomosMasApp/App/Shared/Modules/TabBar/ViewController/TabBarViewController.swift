//
//  TabBarViewController.swift
//  SomosMasApp
//
//  Created by Maximiliano Ituarte on 25/03/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // These lines change the colors of the items of the Tab Bar
        let TabBarAppearace = UITabBar.appearance()
        TabBarAppearace.tintColor = .systemBlue
        TabBarAppearace.unselectedItemTintColor = .darkGray
        
        // These two lines sets the title and the icon of the Tab Bar. They are used in line 33
        let firstTabTitle = "Home"
        let firstTabImage = UIImage(systemName: "house")
        
        // This line sets the view controller with the tab.
        let firstTabViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        firstTabViewController.title = "Home"
        
        // this line set the Navigation bar with the Tab bar
        let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        
        //This line sets details of the items from the tab.
        firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        
        
        //As a example i added a second tab to the tab bar here.
        
        let secondViewController = SecondScreenViewController(nibName: "SecondScreenViewController", bundle: nil)
        
        secondViewController.title = "Screen 2"
        
        let secondTabNavigationController = UINavigationController(rootViewController: secondViewController)
        
        secondTabNavigationController.tabBarItem = UITabBarItem(title: "Screen 2", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        
        
        // "Nosotros" Tab
        
        let thirdViewController = NosotrosViewController(nibName: "NosotrosViewController", bundle: nil)
        
        thirdViewController.title = "Nosotros"
        
        let thirdTabNavigationController = UINavigationController(rootViewController: thirdViewController)
        
        thirdTabNavigationController.tabBarItem = UITabBarItem(title: "Nosotros", image: UIImage(systemName: "person.3"), selectedImage: nil)
        
        
        
        // every tab of the app has to be inside this array, so if you are adding a tab bar, you have to add the tab bar here, for example [firstTabNavigationController, secondTabNavigationController, thirdTabBarNavigationController, fourthTabBarNavigationController]
        viewControllers = [firstTabNavigationController, secondTabNavigationController, thirdTabNavigationController]
    }
}


