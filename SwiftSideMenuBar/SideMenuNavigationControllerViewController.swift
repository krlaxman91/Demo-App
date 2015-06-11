//
//  SideMenuNavigationControllerViewController.swift
//  SwiftSideMenuBar
//
//  Created by Laxman on 11/06/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

public class SideMenuNavigationControllerViewController: UINavigationController  , ENSideMenuProtocol {

    
    
    public var sideMenu : SideMenu?
    public var sideMenuAnimationType : ENSideMenuAnimation = .Default
    

    
    
    
   public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public init( menuViewController: UIViewController, contentViewController: UIViewController?) {
        super.init(nibName: nil, bundle: nil)
        
        if (contentViewController != nil) {
            self.viewControllers = [contentViewController!]
        }
        
        sideMenu = SideMenu(sourceView: self.view, menuViewController: menuViewController, menuPosition:.Left)
        view.bringSubviewToFront(navigationBar)
    }

    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setContentViewController(contentViewController: UIViewController) {
        self.sideMenu?.toggleMenu()
        switch sideMenuAnimationType {
        case .None:
            self.viewControllers = [contentViewController]
            break
        default:
            contentViewController.navigationItem.hidesBackButton = true
            self.setViewControllers([contentViewController], animated: true)
            break
        }
        
    }
}
