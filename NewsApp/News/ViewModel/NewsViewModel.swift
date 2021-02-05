//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation

class NewsViewModel: DefaultViewModelOutput {
    var error: Observable<String> = Observable("")
    var loading: Observable<Bool> = Observable(false)
    var success : Observable<Int?> = Observable(nil)
    var news: Observable<GeneralModel<Articles>?> = Observable(nil)
    
    
    
    func getNews(parameters: Parameters) {
        loading.value = true
        ParseManager.shared.getMethod(with: AppConstants.API.news, parameters: parameters) { (result: GeneralModel<Articles>?, error) in


            self.loading.value = false
            if let error = error {
                self.error.value = error
                return
            }
            guard let news = result else { return }
            self.news.value = news
        }
        
    }
    
    
    
}
