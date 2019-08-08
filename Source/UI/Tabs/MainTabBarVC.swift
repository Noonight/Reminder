//
//  MainTabBarVC.swift
//  Reminder
//
//  Created by ayur on 08.08.2019.
//  Copyright © 2019 ayur-team. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabBar()
    }

    func setupTabBar() {
        let tasks = self.createNavController(rootViewController: TasksVC(), image: #imageLiteral(resourceName: "icon_tasks_black"))
        let reminder = self.createNavController(rootViewController: RemindVC(), image: #imageLiteral(resourceName: "icon_repeat_black"))
        
        self.viewControllers = [tasks, reminder]

        guard let items = self.tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 5.5, left: 0, bottom: -5.5, right: 0)
        }
    }

}

extension MainTabBarVC {

    private func createNavController(rootViewController: UIViewController, image: UIImage, selectedImage: UIImage? = nil) -> UINavigationController {
        let viewController = UINavigationController(rootViewController: rootViewController)
        viewController.navigationBar.prefersLargeTitles = true
        viewController.tabBarItem.image = image
        if let selectedImage = selectedImage {
            viewController.tabBarItem.selectedImage = selectedImage
        }
        return viewController
    }
}

extension UIViewController {
    fileprivate static func storyboardInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self))
    }
}
