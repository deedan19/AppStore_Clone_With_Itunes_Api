//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by Decagon on 13/07/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavControllers(viewController: AppsPageController(), title: "Apps", imageName: "square.stack.3d.up.fill"),
            createNavControllers(viewController: AppSearchController(), title: "Search", imageName: "magnifyingglass"),
            createNavControllers(viewController: UIViewController(), title: "Today", imageName: "doc.append.fill"),
          
           
        ]
    }
    
    fileprivate func createNavControllers (viewController: UIViewController, title: String, imageName: String) -> UIViewController{
        viewController.view.backgroundColor = .white
        viewController.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
    
    
    
}
