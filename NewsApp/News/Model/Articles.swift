//
//  News.swift
//  NewsApp
//
//  Created by Admin on 1/30/21.
//

import Foundation

struct Articles:Codable{
    let source:Source?
    let author: String?
    let title: String?
    let description: String?
    let url:String?
    let urlToImage:String?
    let publishedAt: String?
    let content: String?
}

struct Source:Codable {
    let id: String?
    let name: String?
}
