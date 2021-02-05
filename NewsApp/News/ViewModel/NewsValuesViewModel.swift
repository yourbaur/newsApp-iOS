//
//  NewsValuesViewModel.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation

protocol ViewModelConfigurable {
    var errorMessage: String {get set}
    var parameters: Parameters {get set}
    func getParameters() -> Parameters?
}

class NewsValuesViewModel  {
    var errorMessage: String = ""
    var parameters: Parameters = [:]

    private var country:String = String()
    private var apiKey:String = AppConstants.apiKey
    
    func setCountry(country:String) {
        self.country = country
    }
    
    func getNews() -> Parameters {
        parameters["apiKey"] = apiKey
        parameters["country"] = country
        
        return parameters
    }
}
