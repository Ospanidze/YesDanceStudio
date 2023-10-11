//
//  RootViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 08.10.2023.
//

import UIKit

enum Tab: String {
    case main = "Главная"
    case subscription = "Абонемент"
    case schedule = "Расписание"
    case profile = "Профиль"
    
    var image: String {
        switch self {
        case .main:
            return "square.grid.2x2"
        case .subscription:
            return "tablecells"
        case .schedule:
            return "list.bullet.clipboard"
        case .profile:
            return "person.circle"
        }
    }
}

final class RootViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupTabBar()
        setupBarButtons()
    }
    
    private func configure() {
        tabBar.backgroundColor = .systemPink
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .white
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 1
       // tabBar.layer.masksToBounds = true
    }
    
    private func setupTabBar() {
        let mainNavigationVC = createNavigationVC(
            vc: MainViewController(),
            title: Tab.main.rawValue,
            imageTitle: Tab.main.image
        )
        let subscriptionNavigationVC = createNavigationVC(
            vc: SubscriptionViewController(),
            title: Tab.subscription.rawValue,
            imageTitle: Tab.subscription.image
        )
        let scheduleNavigationVC = createNavigationVC(
            vc: ScheduleViewController(),
            title: Tab.schedule.rawValue,
            imageTitle: Tab.schedule.image
        )
        let profileNavigationVC = createNavigationVC(
            vc: ProfileViewController(),
            title: Tab.profile.rawValue,
            imageTitle: Tab.profile.image
        )
        
        viewControllers = [
            mainNavigationVC,
            subscriptionNavigationVC,
            scheduleNavigationVC,
            profileNavigationVC
        ]
        
    }
    
    private func setupBarButtons() {
        let leftListBarItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        
        let rightPhoneBarItem = UIBarButtonItem(image: UIImage(systemName: "phone"), style: .plain, target: self, action:  #selector(rightBarButtonItemTapped))
        
        let rightBellBarItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action:  #selector(rightBarButtonItemTapped))
        
        let titleView = createTitleView(Constant.title)
        
        navigationItem.titleView = titleView
        navigationItem.leftBarButtonItem = leftListBarItem
        navigationItem.rightBarButtonItems = [rightPhoneBarItem, rightBellBarItem]
    }
    
    @objc private func rightBarButtonItemTapped() {
        
    }
    
    private func createNavigationVC(vc: UIViewController, title: String, imageTitle: String) -> UINavigationController {
        let tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageTitle),
            selectedImage: nil
        )
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem = tabBarItem
        //navVC.navigationBar.backgroundColor = .white
       
//        navVC.navigationBar.prefersLargeTitles = false
//
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//        navBarAppearance.backgroundColor = UIColor(named: "MilkBlue") ?? .white
//
//        navVC.navigationBar.barStyle = .default
//        navVC.navigationBar.standardAppearance = navBarAppearance
//        navVC.navigationBar.scrollEdgeAppearance = navBarAppearance
//        navVC.navigationBar.tintColor = .white
       
        
        return navVC
    }
}
