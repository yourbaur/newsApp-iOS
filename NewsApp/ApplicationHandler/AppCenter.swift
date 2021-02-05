//
//  AppCenter.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit


class AppCenter{
    
    //MARK: - Properties
    var window: UIWindow = UIWindow()
    static let shared = AppCenter()
    private var currentViewController: UIViewController = UIViewController()
    private var width = UIScreen.main.bounds.width
    
    
    //MARK: - Start functions
    func createWindow(_ window: UIWindow) -> Void {
        self.window = window
    }
    
    func start() -> Void {
        makeRootController()
        makeKeyAndVisible()
        
    }
  
    private func makeKeyAndVisible() -> Void {
        window.makeKeyAndVisible()
        window.backgroundColor = .white
       
    }
    
    func setRootController(_ controller: UIViewController) -> Void {
        //currentViewController = controller
        window.rootViewController = controller
    }
    
    func setCurrentViewController(controller: UIViewController) -> Void {
        self.currentViewController = controller
    }
 
    func makeRootController() -> Void {
        setRootController(NewsViewController().inNavigation())
    }
    
}

