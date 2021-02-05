//
//  NetworkManager.swift
//  Dictionary
//
//  Created by Admin on 12/18/20.
//

import Foundation


protocol NetworkManager {
    func request<T: Codable>(_ route: EndpointType, completion: @escaping (Result<T>) -> Void)
    func cancel()
}

