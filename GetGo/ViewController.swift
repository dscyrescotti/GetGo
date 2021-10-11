//
//  ViewController.swift
//  GetGo
//
//  Created by Dscyre Scotti on 10/10/2021.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let iconImage = UIImage(named: "car")?.resizeImage(targetSize: .init(width: 45, height: 45))
        iconImage?.draw(in: .init(x: 0, y: 0, width: 30, height: 30))
        homeVC.tabBarItem = .init(title: "Rent a car", image: iconImage, selectedImage: iconImage)
        let bookingVC = UIViewController()
        bookingVC.view.backgroundColor = .systemBackground
        bookingVC.tabBarItem = .init(title: "Bookings", image: UIImage(systemName: "checkmark.square"), selectedImage: UIImage(systemName: "checkmark.square"))
        let giftVC = UIViewController()
        giftVC.view.backgroundColor = .systemBackground
        giftVC.tabBarItem = .init(title: "Refer a friend", image: UIImage(systemName: "gift"), selectedImage: UIImage(systemName: "gift"))
        let accountVC = UIViewController()
        accountVC.view.backgroundColor = .systemBackground
        accountVC.tabBarItem = .init(title: "Account", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape"))
        
        viewControllers = [homeVC, bookingVC, giftVC, accountVC]
        
        tabBar.backgroundColor = UIColor(named: "backgroundColor")
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.gray
    }
}

