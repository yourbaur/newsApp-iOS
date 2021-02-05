//
//  AppConstants.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit


class AppConstants {
    static let statusBarHeight = UIApplication.shared.statusBarFrame.height
    static let screenHeight = UIScreen.main.bounds.height
    static let screenWidth = UIScreen.main.bounds.width
    static let navBarHeight = UINavigationController().navigationBar.bounds.height
    static let smallNavBarHeight = 40
    static let totalNaBarHeight = statusBarHeight + navBarHeight
    static let apiKey = "2ad80434c61e4281bd6feeb1c62d515f"

  
    
    enum API {
        static let news = "top-headlines"
    }
}
