//
//  NaverAPI.swift
//  MovieReview_MVP
//
//  Created by 장기화 on 2022/01/20.
//

import Foundation

struct NaverAPI: Codable {
    let items: [Movie]
}

struct Movie: Codable {
    let title: String
    private let image: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: String
    
    var imageURL: URL? {
        return URL(string: image) }
}
