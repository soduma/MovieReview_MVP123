//
//  MockMovieManager.swift
//  MovieReview_MVPTests
//
//  Created by 장기화 on 2022/01/26.
//

import Foundation
@testable import MovieReview_MVP

final class MockMovieManager: MovieManagerProtocol {
    var isCalledFetchMovie = false
    var needToSuccessFetch = false
    
    func fetchMovie(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        isCalledFetchMovie = true
        
        if needToSuccessFetch {
            completionHandler([])
        }
    }
}
