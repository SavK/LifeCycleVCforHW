//
//  TabBarController.swift
//  LifeCycleVCforHW
//
//  Created by Savonevich Constantine on 4/27/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    enum tabBarMenu: Int, CaseIterable {
        case blue
        case green
        case yellow
        case tomato
        case purple
    }
    
    override func viewDidLoad() {

//  guard for checking tabbar items (force images extraction)
        guard tabBar.items!.count == tabBarMenu.allCases.count else { return }
        
        colorImagesForTabBar()
    }
    
    // MARK: Private func for change image of tab bar items
    private  func colorImagesForTabBar() {
        
        let tabBar = self.tabBar
        
        let blue = UIImage(named: "blue")?.withRenderingMode(.alwaysOriginal)
        let green = UIImage(named: "green")?.withRenderingMode(.alwaysOriginal)
        let yellow = UIImage(named: "yellow")?.withRenderingMode(.alwaysOriginal)
        let tomato = UIImage(named: "tomato")?.withRenderingMode(.alwaysOriginal)
        let purpure = UIImage(named: "purple")?.withRenderingMode(.alwaysOriginal)
        
        (tabBar.items![0] ).selectedImage = blue
        (tabBar.items![1] ).selectedImage = green
        (tabBar.items![2] ).selectedImage = yellow
        (tabBar.items![3] ).selectedImage = tomato
        (tabBar.items![4] ).selectedImage = purpure
    }
}
