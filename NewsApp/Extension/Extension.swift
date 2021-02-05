//
//  Extension.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation
import UIKit

enum AlertMessageType: String {
    case error = "Ошибка"
    case none = "Внимание"
}


extension String {
    func toDate() -> String {
        if self.count>8{
            let date = self.prefix(10) ?? ""
            let day = date.split(separator: "-")[2]
            let month = date.split(separator: "-")[1]
            let year = date.split(separator: "-")[0]
        
            return "\(day).\(month).\(year)"
        }
        return ""
    }
}
extension UIViewController {
    
    func addSubview(_ view: UIView) -> Void {
        self.view.addSubview(view)
    }
    
    func inNavigation() -> UIViewController {
        return UINavigationController(rootViewController: self)
    }
    
    func showErrorMessage(messageType: AlertMessageType, _ message: String, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: messageType.rawValue, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                if let completionHandler = completion {
                    self.dismiss(animated: true, completion: nil)
                    completionHandler()
                }
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

//MARK: - UIColor
extension UIColor {
    static let mainColor = #colorLiteral(red: 0.1254901961, green: 0.05490196078, blue: 0.1960784314, alpha: 1)
    static let anotherWhite = #colorLiteral(red: 0.1254901961, green: 0.05490196078, blue: 0.1960784314, alpha: 0.04963077911)
    static let notMainColor = #colorLiteral(red: 0.1254901961, green: 0.05490196078, blue: 0.1960784314, alpha: 0.04963077911)
    static let inputViewColor = #colorLiteral(red: 0.4784313725, green: 0.6941176471, blue: 0.862745098, alpha: 1)
    static let anotherBlue = #colorLiteral(red: 0.631372549, green: 0.7215686275, blue: 0.8117647059, alpha: 1)
    static let lineColor = #colorLiteral(red: 0.8431372549, green: 0.8470588235, blue: 0.8509803922, alpha: 1)
    
}
