//
//  TabBarController.swift
//  HSU
//
//  Created by Batuhan Baran on 12.03.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    var icon1 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "pin"), tag: 0)
    var icon2 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "vaccine"), tag: 1)
    var icon3 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "home"), tag: 2)
    var icon4 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "bell"), tag: 3)
    var icon5 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "settings"), tag: 4)
    
    var indicatorImage: UIImageView?
    
    var freshLaunch = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = UIViewController()
        let item2 = UIViewController()
        
        let item3 = UINavigationController(rootViewController: HomeViewController(nibName: "HomeViewController", bundle: .main))
        
        let item4 = UINavigationController(rootViewController: ReminderViewController(nibName: "ReminderViewController", bundle: .main))
        
        let item5 = UINavigationController(rootViewController: AccountViewController(nibName: "AccountViewController", bundle: .main))
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        item4.tabBarItem = icon4
        item5.tabBarItem = icon5
        
        let controllers = [item1, item2, item3, item4, item5]
        self.viewControllers = controllers
        
        self.selectedIndex = 2
        
    }
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if !((indicatorImage?.isDescendant(of: tabBar)) != nil) {
            
            let numberOfItems = CGFloat(tabBar.items!.count)
            let tabBarItemSize = CGSize(width: (tabBar.frame.width / numberOfItems) - 20, height: tabBar.frame.height)
            indicatorImage = UIImageView(image: createSelectionIndicator(color: #colorLiteral(red: 0.9803921569, green: 0.7803921569, blue: 0.3529411765, alpha: 1), size: tabBarItemSize, lineHeight: 4))
            indicatorImage?.center.x =  tabBar.frame.width/5/2
            tabBar.addSubview(indicatorImage!)
        }
        
        UIView.animate(withDuration: 0.3) {
            
            let number = -(tabBar.items?.firstIndex(of: item)?.distance(to: 0))! + 1
            
            if number == 1 {
                
                self.indicatorImage?.isHidden = false
                self.indicatorImage?.center.x =  tabBar.frame.width/5/2
                
            } else if number == 2 {
                
                self.indicatorImage?.isHidden = false
                self.indicatorImage?.center.x =  tabBar.frame.width/5/2 + tabBar.frame.width/5
                
            }
            else if number == 3 {
                
                self.indicatorImage?.isHidden = true
                
            }
            else if number == 4 {
                
                self.indicatorImage?.isHidden = false
                self.indicatorImage?.center.x =  tabBar.frame.width/5/2 + tabBar.frame.width/5 * 3
                
            }
            
            else {
                
                self.indicatorImage?.isHidden = false
                self.indicatorImage?.center.x = tabBar.frame.width - tabBar.frame.width/5/2
                
            }
            
        }
    }
    
    
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: lineHeight )
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
