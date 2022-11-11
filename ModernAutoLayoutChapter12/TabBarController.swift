//
//  TabBarController.swift
//  ModernAutoLayoutChapter12
//
//  Created by Pavlov Matvey on 11.11.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        view.backgroundColor = .white //уровень цвета 2
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().isTranslucent = false
        tabBar.tintColor = .purple
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
//        navController.navigationBar.isTranslucent = false
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
//            createNavController(for: FirstVC11(), title: NSLocalizedString("First", comment: ""), image: UIImage(systemName: "1.circle")!),
//            createNavController(for: SecondVC11(), title: NSLocalizedString("Second", comment: ""), image: UIImage(systemName: "2.circle")!),
//            createNavController(for: ThirdVC8(), title: NSLocalizedString("Third", comment: ""), image: UIImage(systemName: "3.circle")!)
        ]
    }
}

