//
//  GPTabBarViewController.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/3/29.
//  Copyright © 2017年 lignpeng. All rights reserved.
//

import UIKit

class GPTabBarViewController: UITabBarController,UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        let main = GPMainViewController()
        let mainNavi = UINavigationController(rootViewController: main)
        mainNavi.tabBarItem = UITabBarItem(title: "首页", image: nil, selectedImage: nil)
        let my = GPMyViewController()
        let myNavi = UINavigationController(rootViewController: my);
        myNavi.tabBarItem = UITabBarItem(title: "我", image: nil, selectedImage: nil)
        self.viewControllers = [mainNavi,myNavi]
        
        
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}
