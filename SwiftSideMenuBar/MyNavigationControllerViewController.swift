//
//  MyNavigationControllerViewController.swift
//  SwiftSideMenuBar
//
//  Created by Laxman on 11/06/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

class MyNavigationControllerViewController: SideMenuNavigationControllerViewController , ENSideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = SideMenu(sourceView: self.view, menuViewController: MyMenuTableViewController(), menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        //sideMenu?.bouncingEnabled = false
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }


}
