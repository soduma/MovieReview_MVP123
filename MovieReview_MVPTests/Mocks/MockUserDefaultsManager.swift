//
//  MockUserDefaultsManager.swift
//  MovieReview_MVPTests
//
//  Created by 장기화 on 2022/01/26.
//

import Foundation
@testable import MovieReview_MVP

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetMovies = false
    var isCalledAddMovie = false
    var isCalledRemoveMovie = false
    
    func getMovies() -> [Movie] {
        isCalledGetMovies = true
        return []
    }
    
    func addMovie(_ newValue: Movie) {
        isCalledAddMovie = true
    }
    
    func removeMovie(_ value: Movie) {
        isCalledRemoveMovie = true
    }
}
