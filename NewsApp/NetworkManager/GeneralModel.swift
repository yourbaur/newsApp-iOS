//
//  GeneralModel.swift
//  Dictionary
//
//  Created by Admin on 12/18/20.
//

import Foundation

class GeneralModel<T: Codable>: Codable {
    
    let status:String?
    var articles: [T]?
    var totalResults:Int?
}
