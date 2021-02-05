//
//  GeneralResponse.swift
//  Dictionary
//
//  Created by Admin on 12/18/20.
//

import Foundation

class GeneralResponse<T: Codable>: Codable {
    let response: T
}
