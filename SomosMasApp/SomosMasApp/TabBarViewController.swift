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
        
            // This line change the color of the Tab Bar
            let TabBarAppearace = UITabBar.appearance()
        
            TabBarAppearace.backgroundColor = UIColor(hexString: "#9AC9FB")
            TabBarAppearace.tintColor = .black
            TabBarAppearace.unselectedItemTintColor = .systemGray

        
            // These two lines are used in line 34
            let firstTabTitle = "Home"
            let firstTabImage = UIImage(systemName: "house")
            
            // This line set the view controller with the tab.
            let firstTabViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            firstTabViewController.title = "Home"
            
            // this line set the navigation bar with the tab bar
            let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        
            // this line changes the color of the navigation bar
            firstTabNavigationController.navigationBar.backgroundColor = UIColor(hexString: "#9AC9FB")
            firstTabNavigationController.navigationBar.isTranslucent = false
            
            //This line set details of the first tab, like the title or the icon.
            firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
            
           // every tab of the app has to be in this array, so if you are adding a tab bar, you have to add the tab bar here, for example [firstTabNavigationController, secondTabNavigationController]
            viewControllers = [firstTabNavigationController]
        
        }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
