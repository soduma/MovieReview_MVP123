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
    
    var isLiked: Bool
    
    var imageURL: URL? { return URL(string: image) }
    
    private enum CodingKeys: String, CodingKey {
        case title, image, pubDate, director, actor, userRating
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? "-"
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        pubDate = try container.decodeIfPresent(String.self, forKey: .pubDate) ?? "-"
        director = try container.decodeIfPresent(String.self, forKey: .director) ?? "-"
        actor = try container.decodeIfPresent(String.self, forKey: .actor) ?? "-"
        userRating = try container.decodeIfPresent(String.self, forKey: .userRating) ?? "-"
        
        isLiked = false
    }
    
    init(title: String,
         imageURL: String,
         pubDate: String,
         director: String,
         actor: String,
         userRating: String,
         isLiked: Bool = false) {
        self.title = title
        self.image = imageURL
        self.pubDate = pubDate
        self.director = director
        self.actor = actor
        self.userRating = userRating
        self.isLiked = isLiked
    }
}
